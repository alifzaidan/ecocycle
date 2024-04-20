import 'package:ecocycle/screens/article_screen.dart';
import 'package:ecocycle/screens/history_screen.dart';
import 'package:ecocycle/screens/home_screen.dart';
import 'package:ecocycle/screens/profile_screen.dart';
import 'package:ecocycle/screens/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

List<Widget> _buildScreens() {
  return [
    const HomeScreen(),
    const HistoryScreen(),
    const ScanScreen(),
    const ArticleScreen(),
    const ProfileScreen(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(PhosphorIconsRegular.house, size: 30),
      activeColorPrimary: const Color(0xFF166A3E),
      inactiveColorPrimary: const Color(0xffA49EB5),
      title: 'Home',
      textStyle: GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(PhosphorIconsRegular.clockCounterClockwise, size: 30),
      activeColorPrimary: const Color(0xFF166A3E),
      inactiveColorPrimary: const Color(0xffA49EB5),
      title: 'History',
      textStyle: GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(PhosphorIconsRegular.scan, size: 36),
      activeColorPrimary: const Color(0xFF2BD07A),
      activeColorSecondary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(PhosphorIconsRegular.article, size: 30),
      activeColorPrimary: const Color(0xFF166A3E),
      inactiveColorPrimary: const Color(0xffA49EB5),
      title: 'Article',
      textStyle: GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(PhosphorIconsRegular.user, size: 30),
      activeColorPrimary: const Color(0xFF166A3E),
      inactiveColorPrimary: const Color(0xffA49EB5),
      title: 'Profile',
      textStyle: GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
  ];
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return PersistentTabView(
      context,
      navBarHeight: 70,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0),
        colorBehindNavBar: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            spreadRadius: -10,
            offset: Offset(0, 0),
          )
        ],
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}
