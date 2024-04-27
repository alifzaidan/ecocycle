import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _headerProfile(context),
              _textContainer(),
              _additionalContent(),
              _bottomIcons()
            ],
          ),
        ),
      ),
    );
  }

  Container _headerProfile(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: 24),
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
          const CircleAvatar(
            radius: 35,
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _textContainer() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Text(
            "Mengenal Macam - macam Jenis Plastik",
            style: GoogleFonts.dmSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Thoriq Khoir',
            style: GoogleFonts.dmSans(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _additionalContent() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey.withOpacity(0.5),
            ),
            child: Center(
              child: Text(
                'Foto Artikel',
                style: GoogleFonts.dmSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Plastik telah menjadi bagian tak terpisahkan dari kehidupan modern kita. Namun, tidak semua plastik diciptakan sama. Beragam jenis plastik memiliki karakteristik unik yang memengaruhi kegunaan, daur ulang, dan dampak lingkungan. Dalam artikel ini, kita akan menjelajahi beberapa macam plastik yang paling umum digunakan: 1.⁠ ⁠PET (Polyethylene Terephthalate): Biasanya digunakan untuk botol air minum, botol soda, dan wadah makanan ringan. PET adalah plastik yang sering didaur ulang untuk dijadikan serat poliester. 2.⁠ ⁠HDPE (High-Density Polyethylene): HDPE dikenal karena kekuatannya yang tinggi dan ketahanannya terhadap bahan kimia. Biasanya digunakan untuk botol susu, botol sampo, pipa air, dan wadah deterjen. 3.⁠ ⁠PVC (Polyvinyl Chloride): PVC adalah plastik serbaguna yang digunakan dalam berbagai aplikasi seperti pipa, lantai vinyl, jendela, dan mainan.Plastik telah menjadi bagian tak terpisahkan dari kehidupan modern kita. Namun, tidak semua plastik diciptakan sama. Beragam jenis plastik memiliki karakteristik unik yang memengaruhi kegunaan, daur ulang, dan dampak lingkungan. Dalam artikel ini, kita akan menjelajahi beberapa macam plastik yang paling umum digunakan: 1.⁠ ⁠PET (Polyethylene Terephthalate): Biasanya digunakan untuk botol air minum, botol soda, dan wadah makanan ringan. PET adalah plastik yang sering didaur ulang untuk dijadikan serat poliester. 2.⁠ ⁠HDPE (High-Density Polyethylene): HDPE dikenal karena kekuatannya yang tinggi dan ketahanannya terhadap bahan kimia. Biasanya digunakan untuk botol susu, botol sampo, pipa air, dan wadah deterjen. 3.⁠ ⁠PVC (Polyvinyl Chloride): PVC adalah plastik serbaguna yang digunakan dalam berbagai aplikasi seperti pipa, lantai vinyl, jendela, dan mainan.",
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
