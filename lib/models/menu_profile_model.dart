import 'package:ecocycle/screens/bookmark_screen.dart';
import 'package:ecocycle/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MenuProfile {
  String name;
  PhosphorFlatIconData icon;
  Widget page;

  MenuProfile({
    required this.name,
    required this.icon,
    required this.page,
  });
}

var menuProfileList = [
  MenuProfile(
    name: 'Notification',
    icon: PhosphorIconsRegular.notification,
    page: const ProfileScreen(),
  ),
  MenuProfile(
    name: 'Bookmark',
    icon: PhosphorIconsRegular.bookmark,
    page: const BookmarkScreen(),
  ),
  MenuProfile(
    name: 'Language',
    icon: PhosphorIconsRegular.globe,
    page: const ProfileScreen(),
  ),
  MenuProfile(
    name: 'Help Center',
    icon: PhosphorIconsRegular.question,
    page: const ProfileScreen(),
  ),
];
