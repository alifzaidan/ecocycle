# Ecocycle

Ecocycle adalah aplikasi inovatif yang memberdayakan pengguna untuk memberikan dampak langsung terhadap kelestarian lingkungan. Memanfaatkan teknologi Google, aplikasi ini memberikan pengalaman intuitif dan menyenangkan untuk memindai dan mengelola sampah sehari-hari. Aplikasi ini menerapkan beberapa fitur antara lain, asynchronus programming, dark mode dengan shared preferences, dan stored local data dengan sqflite.
<br><br><img src="assets/images/logo_hijau.png" width="150"/><br>

## 1. Asynchronus Programming

-   Models
    Dari gambar terlihat bahwa bagian model terdiri dari tiga file yaitu article_model.dart, bookmark_model.dart dan menu_profile_model.dart yang merupakan PODO (plain old dart objek) digunakan untuk membentuk format objek dari data json yang diperoleh dari server. PODO berfungsi sebagai wadah untuk menyusun data JSON menjadi struktur objek yang terstruktur dan mudah diakses oleh aplikasi. Berdasarkan dokumentasi API JSON, data artikel, bookmark, dan menu profil dapat diekstrak dari sumber JSON yang sama. Hal ini memungkinkan aplikasi untuk melakukan satu permintaan tunggal dengan URL endpoint yang sama untuk mengambil semua data yang diperlukan.
    <br><br><img src="assets/images/model.png" width="150"/><br>

-   Screens
    Di bagian screens digunakan untuk menampilkan article dengan layout tampilan yang kode programnya terdapat dalam file article_screen.dart untuk daftar resep masakan dan article_detail.dart untuk detailnya. Beberapa file screen yang ada sebagai berikut :
    <br><br><img src="assets/images/screens.png" width="150"/><br>
    Tampilan layout yang dimaksud seperti gambar berikut:
    <br><br><img src="assets/images/article.png" width="250"/><br>

-   Services
    Pada bagian services digunakan untuk mengambil API endpoint dari artikel tentang limbah yang terbaru dan juga bookmark untuk melakukan proses CRUD pada aplikasi ini.
    <br><br><img src="assets/images/services.png" width="150"/><br>

## 2. Dark Mode dengan Shared Preferences

Dark Mode adalah fitur yang memungkinkan pengguna untuk mengubah tampilan antarmuka aplikasi menjadi latar belakang yang gelap dengan teks yang lebih terang. Dalam konteks pengembangan aplikasi Android, shared preferences adalah mekanisme penyimpanan data yang memungkinkan aplikasi untuk menyimpan preferensi pengguna, seperti pengaturan Dark Mode. Dengan menggunakan shared preferences, pengembang dapat menyimpan status Dark Mode yang dipilih oleh pengguna dan menggunakannya untuk mengatur tampilan aplikasi secara konsisten setiap kali aplikasi dibuka.

-   Switch pada halaman settings untuk mengatur gelap dan terang
    <br><br><img src="assets/images/settings.png" width="250"/><br>
-   Halaman Home saat Mode Terang
    <br><br><img src="assets/images/home_light.png" width="250"/><br>
-   Halaman Home saat Mode Gelap
    <br><br><img src="assets/images/home_dark.png" width="250"/><br>

## 3. Stored local data dengan sqflite.

Stored local data dengan sqflite adalah mekanisme penyimpanan data lokal dalam pengembangan aplikasi Android menggunakan SQLite. Sqflite merupakan plugin Flutter yang memungkinkan pengembang untuk membuat, membaca, memperbarui, dan menghapus data dalam database SQLite secara efisien. Dengan menggunakan sqflite, pengembang dapat menyimpan data aplikasi seperti pengaturan pengguna, riwayat, atau informasi lainnya secara persisten di perangkat pengguna. Hal ini memungkinkan pengguna untuk mengakses dan mengelola data secara lokal dengan mudah, seperti menyimpan bookmark atau artikel berita dalam aplikasi.
<br><br><img src="assets/images/bookmarks.png" width="250"/><br>

## 4. Akses Kamera

Akses kamera pada aplikasi ini digunakan untuk memindai gambar sampah yang akan diproses untuk diketahui jenis dari sampah tersebut, organik atau non-organik? masih layak atau tidak layak?. Kami menggunakan package camera untuk mengakses kamera dan image_picker untuk mengakses gallery untuk mengambil gambar dari perangkat.
<br><br><img src="assets/images/scan_image.png" width="250"/><br>
<br><br><img src="assets/images/upload_image.png" width="250"/><br>

## 5. Push & Local Notification

Notifikasi yang kami gunakan ada dua jenis yaitu push notification dan local notification. Push notifikation akan dilakukan secara otomatis dari firabase messaging setiap jam 10 pagi untuk mengingatkan agar pengguna tetap mengelola sampahnya. Untuk local notification menggunakan package flutter_local_notification yang akan muncul ketika user selesai untuk mengunggah gambarnya ke database kami.
<br><br><img src="assets/images/notification.png" width="250"/><br>

## Paket yang Digunakan

google_fonts: ^6.1.0 (https://pub.dev/packages/google_fonts)<br>
flutter_staggered_grid_view: ^0.7.0 (https://pub.dev/packages/flutter_staggered_grid_view)<br>
phosphor_flutter: ^2.0.1 (https://pub.dev/packages/phosphor_flutter)<br>
expandable: ^5.0.1 (https://pub.dev/packages/expandable)<br>
firebase_core: ^2.27.0 (https://pub.dev/packages/firebase_core)<br>
shared_preferences: ^2.2.3 (https://pub.dev/packages/shared_preferences)<br>
http: ^1.2.0 (https://pub.dev/packages/http)<br>
intl: ^0.19.0 (https://pub.dev/packages/intl)<br>
sqflite: ^2.3.2 (https://pub.dev/packages/sqflite)<br>
path: ^1.8.3 (https://pub.dev/packages/path)<br>
firebase_auth: ^4.17.8 (https://pub.dev/packages/firebase_auth)<br>
cloud_firestore: ^4.15.8 (https://pub.dev/packages/cloud_firestore)<br>
rxdart: ^0.27.7 (https://pub.dev/packages/rxdart)<br>
flutter_local_notifications: ^17.1.2 (https://pub.dev/packages/flutter_local_notifications)<br>
firebase_messaging: ^14.7.19 (https://pub.dev/packages/firebase_messaging)<br>
image_picker: ^1.0.8 (https://pub.dev/packages/image_picker)<br>
persistent_bottom_nav_bar_v2: ^5.2.3 (https://pub.dev/packages/persistent_bottom_nav_bar_v2)<br>
firebase_database: ^10.4.9 (https://pub.dev/packages/firebase_database)<br>
share_plus: ^7.2.2 (https://pub.dev/packages/share_plus)<br>
url_launcher: ^6.3.0 (https://pub.dev/packages/url_launcher)<br>
timeago: ^3.6.1 (https://pub.dev/packages/timeago)<br>
camera: ^0.11.0+1 (https://pub.dev/packages/camera)<br>
firebase_storage: ^11.6.9 (https://pub.dev/packages/firebase_storage)<br>

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

-   [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
-   [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
