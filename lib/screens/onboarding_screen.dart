import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                Text(
                  'Ecocycle',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.dmSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 90),
                Image.asset('assets/images/onboarding_pict.png'),
                const SizedBox(height: 112),
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
                          color: const Color(0xffFF9228),
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
        backgroundColor: const Color(0xff130160),
        child: const Icon(
          Icons.arrow_forward_sharp,
          color: Colors.white,
        ),
      ),
    );
  }
}
