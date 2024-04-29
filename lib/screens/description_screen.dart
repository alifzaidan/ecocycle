import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _description(context),
        const SizedBox(height: 20),
        _funfact(context),
        const SizedBox(height: 20),
        _trashGallery(context),
        const SizedBox(height: 50),
        _applyButton(context),
      ],
    );
  }

  Widget _description(BuildContext context) {
    return ExpandablePanel(
      header: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Deskripsi',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      collapsed: const Text(
        'Limbah plastik merupakan salah satu masalah lingkungan yang sangat serius. Limbah plastik memiliki dampak negatif yang sangat besar terhadap lingkungan. Ada beberapa cara yang dapat dilakukan untuk mengurangi limbah plastik, antara lain dengan mengurangi penggunaan plastik sekali pakai, membawa wadah sendiri, menggunakan tas belanja yang dapat digunakan kembali, dan membeli produk yang ramah lingkungan.',
        style: TextStyle(fontSize: 12),
        textAlign: TextAlign.justify,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
      expanded: const Text(
        'Limbah plastik merupakan salah satu masalah lingkungan yang sangat serius. Limbah plastik memiliki dampak negatif yang sangat besar terhadap lingkungan. Ada beberapa cara yang dapat dilakukan untuk mengurangi limbah plastik, antara lain dengan mengurangi penggunaan plastik sekali pakai, membawa wadah sendiri, menggunakan tas belanja yang dapat digunakan kembali, dan membeli produk yang ramah lingkungan.',
        style: TextStyle(fontSize: 12),
        textAlign: TextAlign.justify,
      ),
      theme: const ExpandableThemeData(crossFadePoint: 0),
    );
  }

  Widget _funfact(BuildContext context) {
    return ExpandablePanel(
      header: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Funcact',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      collapsed: const Text(
        'Limbah plastik merupakan salah satu masalah lingkungan yang sangat serius. Limbah plastik memiliki dampak negatif yang sangat besar terhadap lingkungan. Ada beberapa cara yang dapat dilakukan untuk mengurangi limbah plastik, antara lain dengan mengurangi penggunaan plastik sekali pakai, membawa wadah sendiri, menggunakan tas belanja yang dapat digunakan kembali, dan membeli produk yang ramah lingkungan.',
        style: TextStyle(fontSize: 12),
        textAlign: TextAlign.justify,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
      expanded: const Text(
        'Butuh waktu jutaan tahun bagi plastik untuk terurai secara alami! Itu artinya, botol plastik yang Anda gunakan hari ini mungkin masih ada di sekitar bahkan setelah Anda menjadi kakek-nenek. Setiap menit, sekitar 1 juta kantong plastik digunakan di seluruh dunia! Bayangkan berapa banyak tumpukan sampah yang dihasilkan dalam setahun? Cukup untuk mengelilingi bumi 4 kali! Sampah plastik adalah ancaman serius bagi kehidupan laut. Burung laut sering salah mengira plastik sebagai makanan, yang menyebabkan mereka mati tercekik atau kelaparan karena perut mereka penuh dengan plastik. Tidak semua plastik diciptakan sama! Beberapa jenis plastik lebih mudah didaur ulang daripada yang lain. Misalnya, botol plastik PET (polyethylene terephthalate) umumnya dapat didaur ulang menjadi botol baru, sedangkan plastik LDPE (low-density polyethylene) yang digunakan untuk kantong plastik lebih sulit didaur ulang. Daur ulang hanya sebagian dari solusi! Mengurangi penggunaan plastik sekali pakai sama pentingnya dengan mendaur ulangnya. Bawalah botol minum dan tas belanja Anda sendiri, dan pilih produk dengan kemasan minimal. Dengan sedikit kesadaran dan perubahan kebiasaan, kita bisa membuat perbedaan dalam mengurangi sampah plastik dan melindungi lingkungan kita.',
        style: TextStyle(fontSize: 12),
        textAlign: TextAlign.justify,
      ),
      theme: const ExpandableThemeData(crossFadePoint: 0),
    );
  }

  Widget _trashGallery(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Trash Gallery',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _galleryImage('assets/images/TG.jpeg'),
              const SizedBox(width: 10),
              _galleryImage('assets/images/TG.jpeg'),
              const SizedBox(width: 10),
              _galleryImage('assets/images/TG.jpeg'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _galleryImage(String imagePath) {
    return Container(
      width: 180,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _applyButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 62,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF28A77D),
                  Color(0xFF2BD07A),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: const Text(
                'APPLY NOW',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
