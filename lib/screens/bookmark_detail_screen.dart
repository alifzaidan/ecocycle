import 'package:ecocycle/models/bookmark_model.dart';
import 'package:ecocycle/services/bookmark_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:share_plus/share_plus.dart';

class BookmarkDetailScreen extends StatelessWidget {
  const BookmarkDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Bookmark;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              _iconAndImage(context, article),
              _headerArticle(article),
              _content(context, article),
              const Spacer(),
              _bottomIcons(context, article),
            ],
          ),
        ),
      ),
    );
  }

  Container _iconAndImage(BuildContext context, Bookmark article) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(PhosphorIconsRegular.arrowLeft),
              ),
              const SizedBox(width: 48),
              IconButton(
                onPressed: () {
                  Share.share(
                    article.url.toString(),
                    subject: article.title.toString(),
                  );
                },
                icon: const Icon(PhosphorIconsRegular.shareFat),
              ),
            ],
          ),
          CircleAvatar(
            radius: 42,
            foregroundImage: NetworkImage(
              article.urlToImage.toString(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerArticle(Bookmark article) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Text(
            DateFormat('dd MMM yyyy').format(DateTime.parse(
              article.publishedAt.toString(),
            )),
            style: GoogleFonts.dmSans(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            article.title.toString(),
            style: GoogleFonts.dmSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            article.author.toString(),
            style: GoogleFonts.dmSans(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
        ],
      ),
    );
  }

  Container _content(BuildContext context, Bookmark article) {
    List<String> formatArticle = article.content.toString().split('   ');
    return Container(
      height: MediaQuery.of(context).size.height * 0.48,
      padding: const EdgeInsets.only(top: 12, left: 32, right: 32),
      child: Scrollbar(
        child: ListView.builder(
          itemCount: formatArticle.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                formatArticle[index],
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 2,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _bottomIcons(BuildContext context, Bookmark article) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xFFE9F5F1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            "Simpan Artikel",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () async {
              await DBBookmark().delete(article.id);
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
    );
  }
}
