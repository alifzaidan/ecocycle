import 'package:ecocycle/models/bookmark_model.dart';
import 'package:ecocycle/screens/bookmark_detail_screen.dart';
import 'package:ecocycle/services/bookmark_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:share_plus/share_plus.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _backButton(context),
              _contentPage(),
            ],
          ),
        ),
      ),
    );
  }

  Container _backButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff28A77D), Color(0xff0D0140)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
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
          IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerLeft,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              PhosphorIconsBold.arrowLeft,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Bookmark',
            style: GoogleFonts.dmSans(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Column _contentPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                height: MediaQuery.of(context).size.height - 220,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: snapshot.data!.map((bookmark) {
                    return _articleBookmarked(context, bookmark);
                  }).toList(),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  Container _articleBookmarked(BuildContext context, Bookmark bookmark) {
    return Container(
      height: 220,
      margin: const EdgeInsets.only(top: 20, left: 24, right: 24),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                foregroundImage: NetworkImage(
                  bookmark.urlToImage ?? '',
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookmark.author ?? '',
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w700,
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
                        DateFormat('dd MMM yyyy').format(DateTime.parse(
                          bookmark.publishedAt ?? '',
                        )),
                        style: GoogleFonts.dmSans(
                          fontSize: 11,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Share.share(
                        bookmark.url ?? '',
                        subject: bookmark.title ?? '',
                      );
                    },
                    icon: const Icon(
                      PhosphorIconsRegular.shareFat,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await DBBookmark().delete(bookmark.id);
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Bookmark removed'),
                          backgroundColor: Colors.red,
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
            ],
          ),
          const SizedBox(height: 12),
          Text(
            bookmark.title ?? '',
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            bookmark.description ?? '',
            style: GoogleFonts.dmSans(
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  pushScreen(
                    context,
                    settings: RouteSettings(
                        name: "/bookmark-detail", arguments: bookmark),
                    screen: const BookmarkDetailScreen(),
                  );
                },
                child: Container(
                  width: 120,
                  margin: const EdgeInsets.only(right: 1),
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F2F4),
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFF9C951),
                        Color(0xFFFFEAB6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Baca Artikel',
                        style: TextStyle(
                          color: Color(0xFF176B3F),
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        PhosphorIconsRegular.bookOpenText,
                        color: Color(0xFF176B3F),
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
