import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TutorialDetailScreen extends StatelessWidget {
  const TutorialDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height - 32,
            padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _backButton(context),
                _imageScan(),
                const SizedBox(height: 20),
                _contentPage(),
                const SizedBox(height: 50),
                _tutorialPage(context),
                const SizedBox(height: 20),
                _video(context),
                const SizedBox(height: 20),
                _link(context),
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

  Widget _imageScan() {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        alignment: Alignment.center,
        // child: Image.asset(
        //   'assets/images/sampah_plastik.png',
        //   width: 65,
        //   height: 65,
        //   color: Colors.white,
        // ),
      ),
    );
  }

  Column _contentPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Tutorial membuat Vas Bunga',
          style: GoogleFonts.dmSans(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.history,
                color: Colors.black,
              ),
              SizedBox(width: 10),
              Text(
                '5 Minutes',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tutorialPage(BuildContext context) {
    return ExpandablePanel(
      header: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Tutorial',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      collapsed: const Text(
        'Limbah plastik merupakan salah satu masalah lingkungan yang sangat serius. Limbah plastik memiliki dampak negatif yang sangat besar terhadap lingkungan. Ada beberapa cara yang dapat dilakukan untuk mengurangi limbah plastik, antara lain dengan mengurangi penggunaan plastik sekali pakai, membawa wadah sendiri, menggunakan tas belanja yang dapat digunakan kembali, dan membeli produk yang ramah lingkungan. Limbah plastik merupakan salah satu masalah lingkungan yang sangat serius. Limbah plastik memiliki dampak negatif yang sangat besar terhadap lingkungan. Ada beberapa cara yang dapat dilakukan untuk mengurangi limbah plastik, antara lain dengan mengurangi penggunaan plastik sekali pakai, membawa wadah sendiri, menggunakan tas belanja yang dapat digunakan kembali, dan membeli produk yang ramah lingkungan.',
        style: TextStyle(fontSize: 12),
        textAlign: TextAlign.justify,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
      expanded: const Text(
        'Limbah plastik merupakan salah satu masalah lingkungan yang sangat serius. Limbah plastik memiliki dampak negatif yang sangat besar terhadap lingkungan. Ada beberapa cara yang dapat dilakukan untuk mengurangi limbah plastik, antara lain dengan mengurangi penggunaan plastik sekali pakai, membawa wadah sendiri, menggunakan tas belanja yang dapat digunakan kembali, dan membeli produk yang ramah lingkungan. Limbah plastik merupakan salah satu masalah lingkungan yang sangat serius. Limbah plastik memiliki dampak negatif yang sangat besar terhadap lingkungan. Ada beberapa cara yang dapat dilakukan untuk mengurangi limbah plastik, antara lain dengan mengurangi penggunaan plastik sekali pakai, membawa wadah sendiri, menggunakan tas belanja yang dapat digunakan kembali, dan membeli produk yang ramah lingkungan.',
        style: TextStyle(fontSize: 12),
        textAlign: TextAlign.justify,
      ),
      theme: const ExpandableThemeData(crossFadePoint: 0),
    );
  }

  Widget _video(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/images/TG.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _link(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Judul Link',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Ini adalah isi dari link. Anda dapat menambahkan teks atau konten lain sesuai kebutuhan.',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
