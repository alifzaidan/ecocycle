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
    name: 'Language',
    icon: PhosphorIconsRegular.globe,
  ),
  MenuProfile(
    name: 'Help Center',
    icon: PhosphorIconsRegular.question,
  ),
  MenuProfile(
    name: 'Term of Service',
    icon: PhosphorIconsRegular.book,
  ),
  MenuProfile(
    name: 'Privacy Policy',
    icon: PhosphorIconsRegular.fileLock,
  ),
];
