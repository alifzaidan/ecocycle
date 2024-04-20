import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/logo_hijau.png',
                      width: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Ecocycle',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 84),
                Image.asset(
                  'assets/images/ilustrasi2.png',
                ),
                const SizedBox(height: 50),
                RichText(
                  text: TextSpan(
                    text: 'Welcome ',
                    style: GoogleFonts.dmSans(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        height: 1,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'to',
                        style: GoogleFonts.dmSans(
                          color: const Color(0xFF16693D),
                        ),
                      ),
                      const TextSpan(
                        text: '\nEcocycle!',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Let\'s together manage waste wisely.',
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        backgroundColor: const Color(0xFF16693D),
        child: const Icon(
          PhosphorIconsRegular.arrowRight,
          color: Colors.white,
        ),
      ),
    );
  }
}
