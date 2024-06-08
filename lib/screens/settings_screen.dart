import 'package:ecocycle/screens/login_screen.dart';
import 'package:ecocycle/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotification = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void muatPreferensiModeGelap() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      modeGelap = prefs.getBool('modeGelap') ?? false;
    });
  }

  void simpanPreferensiModeGelap(bool mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('modeGelap', mode);
  }

  void pengubahModeGelap(bool mode) {
    setState(() {
      modeGelap = mode;
    });
    simpanPreferensiModeGelap(mode);
  }

  @override
  void initState() {
    super.initState();
    muatPreferensiModeGelap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _backButton(context),
                const SizedBox(height: 20),
                _contentPage(),
              ],
            ),
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
          'Settings',
          style: GoogleFonts.dmSans(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF99ABC6).withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 32,
                offset: const Offset(0, 4),
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: const Icon(
              PhosphorIconsRegular.bellRinging,
            ),
            title: Text(
              'Notification',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Switch(
              value: isNotification,
              onChanged: (value) {
                setState(() {
                  isNotification = value;
                });
              },
              activeColor: const Color(0xFF2BD07A),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF99ABC6).withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 32,
                offset: const Offset(0, 4),
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: const Icon(
              PhosphorIconsRegular.moon,
            ),
            title: Text(
              'Dark Mode',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Switch(
              value: modeGelap,
              onChanged: (value) {
                setState(() {
                  modeGelap = value;
                  pengubahModeGelap(value);
                });
              },
              activeColor: const Color(0xFF2BD07A),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF99ABC6).withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 32,
                offset: const Offset(0, 4),
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: const Icon(
              PhosphorIconsRegular.lockKey,
            ),
            title: Text(
              'Forgot Password',
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: const Icon(
              PhosphorIconsRegular.caretRight,
            ),
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  height: 400,
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
                      Text(
                        'Log out',
                        style: GoogleFonts.dmSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Are you sure you want to leave?',
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 42),
                      Container(
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
                            _auth.signOut();
                            pushScreen(
                              context,
                              settings: const RouteSettings(name: "/login"),
                              screen: const LoginScreen(),
                            );
                          },
                          child: Text(
                            'YES',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        height: 62,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDDDEDD),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF99ABC6).withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 32,
                  offset: const Offset(0, 4),
                )
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(
                PhosphorIconsRegular.signOut,
              ),
              title: Text(
                'Logout',
                style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: const Icon(
                PhosphorIconsRegular.caretRight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
