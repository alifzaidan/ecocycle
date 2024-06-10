import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _contentPage(),
                ],
              ),
            ),
            _backButton(context),
          ],
        ),
      ),
    );
  }

  Container _backButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
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
            'HelpCenter',
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

  Container _contentPage() {
    return Container(
      padding: const EdgeInsets.only(top: 180, left: 32, right: 32, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Apa itu Ecocycle?',
            style:
                GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Ecocycle adalah aplikasi inovatif yang memberdayakan pengguna untuk memberikan dampak langsung terhadap kelestarian lingkungan. Kami memberikan pengalaman intuitif bagi pengguna untuk mengelola sampah sehari-hari dengan memindai dan mengunggah gambar sampah. Serta kami juga memberikan edukasi berupa tutorial daur ulang sampah dan juga artikel terkait sampah.',
            style: GoogleFonts.dmSans(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            'Cara Menggunakan Aplikasi',
            style:
                GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '1. Mulai dengan membuat akun dan login ke dalam aplikasi.\n'
            '2. Gunakan fitur pemindai dan pengunggah gambar untuk mengidentifikasi jenis sampah.\n'
            '3. Pelajari deskripsi sampah sesuai dan kelola sampah anda.\n'
            '4. Jika anda ingin menjualnya, anda bisa mencari lokasi pengepul terdekat.\n'
            '5. Jika anda ingin mendaur ulang, anda bisa melihat tutorial yang kami sediakan.'
            '6. Jangan lupa untuk selalu update dengan artikel terbaru dari kami.',
            style: GoogleFonts.dmSans(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            'Panduan Pengelolaan Sampah',
            style:
                GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Sampah Organik: Sampah yang dapat terurai secara alami, seperti sisa makanan dan dedaunan.\n'
            'Sampah Anorganik Layak: Sampah yang tidak dapat terurai secara alami, seperti plastik dan logam tetapi masih dapat didaur ulang.\n'
            'Sampah Anorganik Tidak Layak: Sampah yang tidak dapat terurai secara alami, seperti plastik dan logam namun sudah tidak dapat didaur ulang.\n'
            'Sampah Berbahaya: Sampah yang berpotensi berbahaya bagi kesehatan dan lingkungan, seperti baterai dan bahan kimia.',
            style: GoogleFonts.dmSans(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            'Fitur Aplikasi',
            style:
                GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '1. Pemindai Sampah: Memungkinkan Anda memindai sampah untuk mengetahui jenisnya.\n'
            '2. Peta Lokasi Pengepul Terdekat: Memungkinkan Anda untuk mencari lokasi pengepul terdekat.\n'
            '3. Artikel: Menampilkan artikel tentang sampah dan pengelolaannya.',
            style: GoogleFonts.dmSans(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            'Frequently Asked Questions (FAQ)',
            style:
                GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Q: Bagaimana cara memulai menggunakan aplikasi?\n'
            'A: Mulai dengan membuat akun dan login ke dalam aplikasi.\n\n'
            'Q: Bagaimana cara memindai sampah?\n'
            'A: Gunakan fitur pemindai pada halaman utama aplikasi dan arahkan kamera ke sampah.',
            style: GoogleFonts.dmSans(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            'Kontak dan Bantuan',
            style:
                GoogleFonts.dmSans(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Jika Anda memiliki pertanyaan atau membutuhkan bantuan, silakan hubungi kami melalui :',
            style: GoogleFonts.dmSans(fontSize: 16),
          ),
          Row(
            children: [
              const Icon(
                PhosphorIconsRegular.envelope,
                color: Color(0xFF16693D),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () async {
                  const email = 'ineat.bisnis@gmail.com';
                  const subject = 'Subject';
                  const body = 'Body';
                  final url =
                      'mailto:$email?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';

                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Text(
                  'ineat.bisnis@gmail.com',
                  style: GoogleFonts.dmSans(
                    fontSize: 16,
                    color: const Color(0xFF16693D),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                PhosphorIconsRegular.phone,
                color: Color(0xFF16693D),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () async {
                  const phone = '+62895403826463';
                  const url = 'https://wa.me/$phone';

                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Text(
                  '0895403826463.',
                  style: GoogleFonts.dmSans(
                    fontSize: 16,
                    color: const Color(0xFF16693D),
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
