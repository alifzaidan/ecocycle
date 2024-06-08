import "package:ecocycle/screens/article_screen.dart";
import "package:ecocycle/screens/history_screen.dart";
import "package:ecocycle/screens/home_screen.dart";
import "package:ecocycle/screens/profile_screen.dart";
import "package:ecocycle/screens/scan_screen.dart";
import "package:ecocycle/screens/upload_screen.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";
import "package:phosphor_flutter/phosphor_flutter.dart";

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: const Icon(PhosphorIconsRegular.house),
            activeForegroundColor: const Color(0xFF166A3E),
            inactiveForegroundColor: const Color(0xffA49EB5),
            title: "Home",
            textStyle: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const HistoryScreen(),
          item: ItemConfig(
            icon: const Icon(PhosphorIconsRegular.clockCounterClockwise),
            activeForegroundColor: const Color(0xFF166A3E),
            inactiveForegroundColor: const Color(0xffA49EB5),
            title: "History",
            textStyle: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        PersistentTabConfig.noScreen(
          onPressed: (context) {
            showModalBottomSheet(
              context: context,
              useRootNavigator: true,
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
                        'What would you like to add?',
                        style: GoogleFonts.dmSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Would you like to scan your trash by camera or add trash picture manually?',
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
                            Navigator.pop(context);
                            pushScreen(
                              context,
                              settings: const RouteSettings(name: "/scan"),
                              screen: const ScanScreen(),
                            );
                          },
                          child: const Text(
                            'SCAN YOUR TRASH',
                            style: TextStyle(
                              color: Colors.white,
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
                            pushScreen(
                              context,
                              settings: const RouteSettings(name: "/upload"),
                              screen: const UploadScreen(),
                            );
                          },
                          child: const Text(
                            'ADD MANUALLY',
                            style: TextStyle(
                              color: Colors.white,
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
          item: ItemConfig(
            icon: const Icon(
              PhosphorIconsRegular.scan,
              size: 30,
            ),
            activeForegroundColor: const Color(0xFF2BD07A),
            inactiveForegroundColor: Colors.white,
            textStyle: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const ArticleScreen(),
          item: ItemConfig(
            icon: const Icon(PhosphorIconsRegular.article),
            activeForegroundColor: const Color(0xFF166A3E),
            inactiveForegroundColor: const Color(0xffA49EB5),
            title: "Article",
            textStyle: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        PersistentTabConfig(
          screen: const ProfileScreen(),
          item: ItemConfig(
            icon: const Icon(PhosphorIconsRegular.user),
            activeForegroundColor: const Color(0xFF166A3E),
            inactiveForegroundColor: const Color(0xffA49EB5),
            title: "Profile",
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style13BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                blurRadius: 20,
                spreadRadius: -10,
                offset: const Offset(0, 0),
              ),
            ],
            color: Theme.of(context).colorScheme.background,
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
        ),
        navBarHeight: 64,
        handleAndroidBackButtonPress: false,
      );
}
