import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DropPointScreen extends StatelessWidget {
  const DropPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [_header(context), _modalBottomSheet(context)],
          ),
        ),
      ),
    );
  }

  Container _header(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(top: 52, left: 24, right: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff28A77D), Color(0xff0D0140)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerLeft,
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
            icon: const Icon(PhosphorIconsBold.arrowLeft),
          ),
          Text(
            "Nearby Drop Point",
            style: GoogleFonts.dmSans(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _modalBottomSheet(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32),
              height: 350,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    PhosphorIconsBold.minus,
                    size: 50,
                    color: Color(0xFF176B3F),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: const Image(
                          image: AssetImage('assets/images/maps.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rumah Sampah',
                            style: GoogleFonts.dmSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 200,
                            child: Text(
                              'Jl. Kendalsari, Tulusrejo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 200,
                            child: Text(
                              '+62 0812-3399-3978',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F4F6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '20 Min',
                          style: GoogleFonts.dmSans(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Estimated Time',
                          style: GoogleFonts.dmSans(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height - 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/maps.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
