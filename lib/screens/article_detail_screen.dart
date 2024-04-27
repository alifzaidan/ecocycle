import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
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
      ),
    );
  }

  Container _headerProfile(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
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
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
              ),
              const SizedBox(width: 48),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
                color: Colors.black,
              ),
            ],
          ),
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _textContainer() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Text(
            "Mengenal Macam - macam Jenis Plastik",
            style: GoogleFonts.lato(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          Text(
            'Thoriq Khoir',
            style: GoogleFonts.lato(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _additionalContent() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
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
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Plastik telah menjadi bagian tak terpisahkan dari kehidupan modern kita. Namun, tidak semua plastik diciptakan sama. Beragam jenis plastik memiliki karakteristik unik yang memengaruhi kegunaan, daur ulang, dan dampak lingkungan. Dalam artikel ini, kita akan menjelajahi beberapa macam plastik yang paling umum digunakan: 1.⁠ ⁠PET (Polyethylene Terephthalate): Biasanya digunakan untuk botol air minum, botol soda, dan wadah makanan ringan. PET adalah plastik yang sering didaur ulang untuk dijadikan serat poliester. 2.⁠ ⁠HDPE (High-Density Polyethylene): HDPE dikenal karena kekuatannya yang tinggi dan ketahanannya terhadap bahan kimia. Biasanya digunakan untuk botol susu, botol sampo, pipa air, dan wadah deterjen. 3.⁠ ⁠PVC (Polyvinyl Chloride): PVC adalah plastik serbaguna yang digunakan dalam berbagai aplikasi seperti pipa, lantai vinyl, jendela, dan mainan.Plastik telah menjadi bagian tak terpisahkan dari kehidupan modern kita. Namun, tidak semua plastik diciptakan sama. Beragam jenis plastik memiliki karakteristik unik yang memengaruhi kegunaan, daur ulang, dan dampak lingkungan. Dalam artikel ini, kita akan menjelajahi beberapa macam plastik yang paling umum digunakan: 1.⁠ ⁠PET (Polyethylene Terephthalate): Biasanya digunakan untuk botol air minum, botol soda, dan wadah makanan ringan. PET adalah plastik yang sering didaur ulang untuk dijadikan serat poliester. 2.⁠ ⁠HDPE (High-Density Polyethylene): HDPE dikenal karena kekuatannya yang tinggi dan ketahanannya terhadap bahan kimia. Biasanya digunakan untuk botol susu, botol sampo, pipa air, dan wadah deterjen. 3.⁠ ⁠PVC (Polyvinyl Chloride): PVC adalah plastik serbaguna yang digunakan dalam berbagai aplikasi seperti pipa, lantai vinyl, jendela, dan mainan.",
            style: GoogleFonts.lato(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
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
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconWithText(
            Icons.favorite_border,
            '12',
          ),
          _buildIconWithText(
            CupertinoIcons.bubble_left,
            '10',
          ),
          _buildIconWithText(
            PhosphorIconsRegular.shareFat,
            '2',
          ),
          _buildIconWithoutText(Icons.bookmark_border),
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
        SizedBox(width: 5),
        Text(
          count,
          style: TextStyle(
            fontSize: 12,
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
