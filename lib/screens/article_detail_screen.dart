import 'package:ecocycle/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              _headerProfile(context, article),
              _textContainer(article),
              _additionalContent(article),
              const Spacer(),
              _bottomIcons(),
            ],
          ),
        ),
      ),
    );
  }

  Container _headerProfile(BuildContext context, Article article) {
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
                onPressed: () {},
                icon: const Icon(PhosphorIconsRegular.dotsThreeVertical),
              ),
            ],
          ),
          CircleAvatar(
            radius: 35,
            foregroundImage: NetworkImage(article.urlToImage ??
                "https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg"),
          ),
        ],
      ),
    );
  }

  Widget _textContainer(Article article) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Text(
            article.title ?? 'Title Not Found',
            style: GoogleFonts.dmSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            article.author ?? 'Author Not Found',
            style: GoogleFonts.dmSans(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          const Divider(),
        ],
      ),
    );
  }

  Widget _additionalContent(Article article) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article.content ?? 'Content Not Found',
            style: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 2,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget _bottomIcons() {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 36),
      decoration: const BoxDecoration(
        color: Color(0xFFE9F5F1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconWithText(
            PhosphorIconsRegular.heart,
            '12',
          ),
          _buildIconWithText(
            PhosphorIconsRegular.chat,
            '10',
          ),
          _buildIconWithText(
            PhosphorIconsRegular.shareFat,
            '2',
          ),
          _buildIconWithoutText(PhosphorIconsRegular.bookmarkSimple),
        ],
      ),
    );
  }

  Widget _buildIconWithText(IconData icon, String count) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(
          count,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildIconWithoutText(IconData icon) {
    return Icon(
      icon,
      color: Colors.grey,
      size: 20,
    );
  }
}
