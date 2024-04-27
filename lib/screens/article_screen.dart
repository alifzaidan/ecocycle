import 'package:ecocycle/screens/article_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
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
      height: 210,
      padding: const EdgeInsets.only(top: 82, left: 24, right: 24),
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
    double totalArticle = 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 72, left: 20, right: 20),
          child: SizedBox(
            height: 300 * totalArticle,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Stack(
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
                              const CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.blueAccent,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Thoriq Khoir',
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
                                        '21 minutes ago',
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
                          Text(
                            "Mengenal Macam - macam Jenis Plastik",
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Plastik telah menjadi bagian tak terpisahkan dari kehidupan modern kita. Namun, tidak semua plastik diciptakan sama. Beragam jenis plastik memiliki karakteristik unik yang memengaruhi kegunaan, daur ulang, dan dampak lingkungan. Dalam artikel ini, kita akan menjelajahi beberapa macam plastik yang paling umum digunakan:",
                            style: GoogleFonts.dmSans(
                              fontSize: 12,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ArticleDetailScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "See more",
                              style: GoogleFonts.dmSans(
                                  fontSize: 12, color: Colors.amber),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
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
                            const Icon(
                              PhosphorIconsRegular.bookmarkSimple,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemCount: totalArticle.toInt(),
            ),
          ),
        ),
      ],
    );
  }
}
