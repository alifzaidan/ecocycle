import 'package:ecocycle/screens/cart_screen.dart';
import 'package:ecocycle/screens/history_screen.dart';
import 'package:ecocycle/screens/home_screen.dart';
import 'package:ecocycle/screens/profile_screen.dart';
import 'package:ecocycle/screens/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

List<Widget> _buildScreens() {
  return [
    const HomeScreen(),
    const CartScreen(),
    const ScanScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(FontAwesomeIcons.house),
      activeColorPrimary: const Color(0xffFF9228),
      inactiveColorPrimary: const Color(0xffA49EB5),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(FontAwesomeIcons.cartShopping),
      activeColorPrimary: const Color(0xffFF9228),
      inactiveColorPrimary: const Color(0xffA49EB5),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(FontAwesomeIcons.expand),
      activeColorPrimary: const Color(0xff130160),
      activeColorSecondary: const Color(0xffFF9228),
      inactiveColorPrimary: Colors.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(FontAwesomeIcons.clockRotateLeft),
      activeColorPrimary: const Color(0xffFF9228),
      inactiveColorPrimary: const Color(0xffA49EB5),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(FontAwesomeIcons.solidUser),
      activeColorPrimary: const Color(0xffFF9228),
      inactiveColorPrimary: const Color(0xffA49EB5),
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
      navBarStyle: NavBarStyle.style17,
    );
  }
}
