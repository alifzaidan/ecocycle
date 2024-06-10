import 'dart:io';

import 'package:ecocycle/helper/local_notification_helper.dart';
import 'package:ecocycle/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? selectedImage;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? imagePicked =
        await picker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      selectedImage = File(imagePicked.path);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              _contentPage(),
              const Spacer(),
              _uploadButton(),
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

  Column _contentPage() {
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
          'Add your garbage image to detect category',
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
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    selectedImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 468,
                              width: MediaQuery.of(context).size.width,
                              child:
                                  Image.file(selectedImage!, fit: BoxFit.cover),
                            ),
                          )
                        : Container(),
                    if (selectedImage == null)
                      TextButton(
                        onPressed: () async {
                          await getImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              PhosphorIconsRegular.fileArrowUp,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Upload Garbage Picture',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              if (selectedImage != null)
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedImage = null;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Container _uploadButton() {
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
        onPressed: () {
          NotificationHelper.showNotification(
            title: "Berhasil Memindai Sampah",
            body: "Data berhasil didapatkan",
            payload: "scan_image",
          );
          pushScreen(
            context,
            settings: const RouteSettings(name: "/result"),
            screen: const ResultScreen(),
          );
        },
        child: const Text(
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
