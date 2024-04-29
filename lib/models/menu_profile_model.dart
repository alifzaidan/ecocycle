import 'package:phosphor_flutter/phosphor_flutter.dart';

class MenuProfile {
  String name;
  PhosphorFlatIconData icon;

  MenuProfile({
    required this.name,
    required this.icon,
  });
}

var menuProfileList = [
  MenuProfile(
    name: 'Notification',
    icon: PhosphorIconsRegular.notification,
  ),
  MenuProfile(
    name: 'Bookmark',
    icon: PhosphorIconsRegular.bookmark,
  ),
  MenuProfile(
    name: 'Language',
    icon: PhosphorIconsRegular.globe,
  ),
  MenuProfile(
    name: 'Help Center',
    icon: PhosphorIconsRegular.question,
  ),
];
