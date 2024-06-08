import 'package:ecocycle/models/bookmark_model.dart';
import 'package:ecocycle/screens/article_detail_screen.dart';
import 'package:ecocycle/services/bookmark_services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final articlesFirebase = FirebaseDatabase.instance.ref("articles");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _headerProfile(context),
              const SizedBox(height: 20),
              _buildListView(),
              const SizedBox(height: 20),
              _article(context),
            ],
          ),
        ),
      ),
    );
  }

  Container _headerProfile(BuildContext context) {
    return Container(
      height: 164,
      padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff28A77D), Color(0xff0D0140)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Article",
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                prefixIcon: const Icon(PhosphorIconsRegular.magnifyingGlass),
                hintText: 'Cari Artikel',
                hintStyle: GoogleFonts.dmSans(),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListView() {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCardIcon(),
              _buildCard("Sampah Plastik"),
              _buildCard("Botol Plastik"),
              _buildCard("Besi"),
              _buildCard("Plastik")
            ],
          )),
    );
  }

  Container _buildCardIcon() {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF28A77D),
            Color(0xFF2BD07A),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Center(
        child: Icon(
          PhosphorIconsRegular.sliders,
          color: Colors.white,
        ),
      ),
    );
  }

  Container _buildCard(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.dmSans(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Column _article(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 500,
          child: FirebaseAnimatedList(
            query: articlesFirebase,
            itemBuilder: (context, snapshot, index, animation) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                height: 220,
                child: Stack(
                  children: [
                    Container(
                      height: 270,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
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
                                  snapshot.child("urlToImage").value.toString(),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.child("author").value.toString(),
                                    style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        PhosphorIconsRegular.clock,
                                        color: Colors.grey[400],
                                        size: 17,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        DateFormat('dd MMM yyyy')
                                            .format(DateTime.parse(
                                          snapshot
                                              .child("publishedAt")
                                              .value
                                              .toString(),
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
                                  const Row(
                                    children: [
                                      Icon(
                                        PhosphorIconsRegular.shareFat,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      final newBookmark = Bookmark(
                                        id: await DBBookmark().getLastId() + 1,
                                        author: snapshot
                                            .child("author")
                                            .value
                                            .toString(),
                                        title: snapshot
                                            .child("title")
                                            .value
                                            .toString(),
                                        description: snapshot
                                            .child("description")
                                            .value
                                            .toString(),
                                        url: snapshot
                                            .child("url")
                                            .value
                                            .toString(),
                                        urlToImage: snapshot
                                            .child("urlToImage")
                                            .value
                                            .toString(),
                                        publishedAt: snapshot
                                            .child("publishedAt")
                                            .value
                                            .toString(),
                                        content: snapshot
                                            .child("content")
                                            .value
                                            .toString(),
                                      );
                                      await DBBookmark().insert(newBookmark);
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text('Bookmarked!'),
                                        backgroundColor: Colors.green,
                                      ));
                                    },
                                    icon: const Icon(
                                      PhosphorIconsRegular.bookmarkSimple,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            snapshot.child("title").value.toString(),
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
                            snapshot.child("content").value.toString(),
                            style: GoogleFonts.dmSans(
                              fontSize: 12,
                            ),
                            maxLines: 3,
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
                                        name: "/article-detail",
                                        arguments: snapshot),
                                    screen: const ArticleDetailScreen(),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 10),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
