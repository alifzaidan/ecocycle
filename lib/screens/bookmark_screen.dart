import 'package:ecocycle/models/bookmark_model.dart';
import 'package:ecocycle/screens/article_detail_screen.dart';
import 'package:ecocycle/services/bookmark_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  Future<List<Bookmark>>? futureBookmark;
  final bookmarkDB = DBBookmark();

  @override
  void initState() {
    super.initState();
    fetchBookmark();
  }

  void fetchBookmark() {
    setState(() {
      futureBookmark = bookmarkDB.list();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _backButton(context),
                const SizedBox(height: 20),
                _contentPage(),
                // const SizedBox(height: 500),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton _backButton(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      alignment: Alignment.centerLeft,
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(PhosphorIconsBold.arrowLeft),
    );
  }

  Column _contentPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bookmark',
          style: GoogleFonts.dmSans(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 32),
        FutureBuilder<List<Bookmark>>(
          future: futureBookmark,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF00BFA6),
                ),
              );
            } else if (snapshot.hasError) {
              return Text(
                '${snapshot.error}',
                style: GoogleFonts.dmSans(
                  color: Colors.amber,
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'No bookmarks yet',
                  style: GoogleFonts.dmSans(
                    color: Colors.amber,
                  ),
                ),
              );
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height - 300,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: snapshot.data!.map((bookmark) {
                    return _buildBookmarkCard(bookmark);
                  }).toList(),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildBookmarkCard(Bookmark bookmark) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ArticleDetailScreen(),
              settings: RouteSettings(arguments: bookmark),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF99ABC6).withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 40,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          foregroundImage:
                              NetworkImage(bookmark.urlToImage ?? ''),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bookmark.author ?? '',
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  PhosphorIconsRegular.clock,
                                  color: Colors.grey[400],
                                  size: 17,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  DateFormat('dd MMM yyyy').format(
                                    DateTime.parse(bookmark.publishedAt ?? ''),
                                  ),
                                  style: GoogleFonts.dmSans(
                                    fontSize: 11,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ArticleDetailScreen(),
                            settings: RouteSettings(arguments: bookmark),
                          ),
                        );
                      },
                      child: Text(
                        bookmark.title ?? '',
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      bookmark.content ?? '',
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ArticleDetailScreen(),
                            settings: RouteSettings(arguments: bookmark),
                          ),
                        );
                      },
                      child: Text(
                        "See more",
                        style: GoogleFonts.dmSans(
                          fontSize: 12,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE9F5F1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            PhosphorIconsFill.heart,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '12',
                            style: GoogleFonts.dmSans(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Row(
                        children: [
                          const Icon(
                            PhosphorIconsRegular.chat,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '10',
                            style: GoogleFonts.dmSans(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Row(
                        children: [
                          const Icon(
                            PhosphorIconsRegular.shareFat,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '2',
                            style: GoogleFonts.dmSans(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () async {
                          await DBBookmark().delete(bookmark.id);
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Bookmark removed'),
                            ),
                          );
                        },
                        icon: const Icon(
                          PhosphorIconsFill.bookmarkSimple,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
