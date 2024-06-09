import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ecocycle/screens/image_preview_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late List<CameraDescription> cameras;
  late CameraController _controller;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      cameras = await availableCameras();
      _controller = CameraController(cameras[0], ResolutionPreset.max);
      await _controller.initialize();
      if (!mounted) return;
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'Akses kamera Ditolak':
            print("Akses kamera Ditolak");
            break;
          default:
            print(e.description);
            break;
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _buildCameraPreview(),
            Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _backButton(context),
                  const SizedBox(height: 20),
                  _contentPage(),
                  const Spacer(),
                  _scanButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraPreview() {
    return Positioned.fill(
      child: _isCameraInitialized
          ? CameraPreview(_controller)
          : const Center(child: CircularProgressIndicator()),
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

  Container _contentPage() {
    return Container(
      height: 540,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimary,
          width: 3,
        ),
      ),
    );
  }

  Container _scanButton() {
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
          if (!_controller.value.isInitialized) {
            return;
          }
          if (_controller.value.isTakingPicture) {
            return;
          }
          try {
            await _controller.setFlashMode(FlashMode.auto);
            XFile file = await _controller.takePicture();
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ImagePreviewScreen(file)),
            );
          } on CameraException catch (e) {
            debugPrint("Terjadi kesalahan saat mengambil gambar : $e");
          }
        },
        child: const Text(
          'SCAN IMAGE',
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
