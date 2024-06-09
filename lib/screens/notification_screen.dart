import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _backButton(context),
              _contentPage(),
            ],
          ),
        ),
      ),
    );
  }

  Container _backButton(BuildContext context) {
    return Container(
      width: double.infinity,
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
            'Notification',
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF99ABC6).withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 40,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 24,
              foregroundImage: AssetImage('assets/images/logo_hijau.png'),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notifikasi Baru!',
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  'Jangan lupa mendaur ulang sampah ya!',
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      DateFormat('dd MMM yyyy')
                          .format(DateTime.parse('2022-01-01T00:00:00Z')),
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Container(
                    //     width: 100,
                    //     margin: const EdgeInsets.only(right: 1),
                    //     decoration: BoxDecoration(
                    //       color: const Color(0xffF2F2F4),
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     padding: const EdgeInsets.symmetric(
                    //         vertical: 8, horizontal: 10),
                    //     child: const Text(
                    //       'Delete',
                    //       style: TextStyle(
                    //         color: Colors.red,
                    //         fontSize: 12,
                    //       ),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
