import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecocycle/helper/local_notification_helper.dart';
import 'package:ecocycle/screens/result_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ImagePreviewScreen extends StatefulWidget {
  final XFile file;
  const ImagePreviewScreen(this.file, {super.key});

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  File? selectedImage;
  String imageUrl = '';
  bool isLoading = false;

  Future<String> uploadImage(File imageFile) async {
    Reference reference = FirebaseStorage.instance
        .ref()
        .child("images/${DateTime.now().toString()}.jpg");

    TaskSnapshot snapshot = await reference.putFile(imageFile);

    if (snapshot.state == TaskState.success) {
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      print('Upload success, firebase url : $downloadUrl');
      return downloadUrl;
    } else {
      print('Upload failed');
      throw Exception('Upload failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    File picture = File(widget.file.path);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _backButton(context),
              const SizedBox(height: 20),
              _contentPage(picture),
              const Spacer(),
              _uploadButton(picture),
            ],
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

  Column _contentPage(File picture) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload Your Garbage',
          style: GoogleFonts.dmSans(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'If the picture is not clear, take another picture',
          style: GoogleFonts.dmSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 470,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).colorScheme.onPrimary),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Center(
                  child: Image.file(
                    picture,
                    height: 468,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: const Icon(
                        PhosphorIconsRegular.arrowBendUpLeft,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _uploadButton(File picture) {
    return Container(
      height: 62,
      width: double.infinity,
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
      child: TextButton(
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          try {
            String imageUrl = await uploadImage(picture);
            final notificationsCollection =
                FirebaseFirestore.instance.collection('history');
            await notificationsCollection.add({
              'name': "Botol Plastik",
              'category': "Worthy Non-Organic",
              'rangePrice': "Rp. 1000 - Rp. 2000 / kg",
              'imageUrl': imageUrl,
              'timestamp': FieldValue.serverTimestamp(),
            });
          } catch (e) {
            // handle error
          } finally {
            setState(() {
              isLoading = false;
            });
          }
          NotificationHelper.showNotification(
            title: "Berhasil Memindai Sampah",
            body: "Data berhasil didapatkan",
            payload: "scan_image",
          );
          // ignore: use_build_context_synchronously
          pushScreen(
            context,
            settings: const RouteSettings(name: "/result"),
            screen: const ResultScreen(),
          );
        },
        child: isLoading
            ? const CircularProgressIndicator()
            : const Text(
                'UPLOAD IMAGE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }
}
