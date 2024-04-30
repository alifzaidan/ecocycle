import 'package:ecocycle/firebase_options.dart';
import 'package:ecocycle/screens/article_screen.dart';
import 'package:ecocycle/screens/history_screen.dart';
import 'package:ecocycle/screens/home_screen.dart';
import 'package:ecocycle/screens/login_screen.dart';
import 'package:ecocycle/screens/navigation.dart';
import 'package:ecocycle/screens/onboarding_screen.dart';
import 'package:ecocycle/screens/profile_screen.dart';
import 'package:ecocycle/screens/register_screen.dart';
import 'package:ecocycle/screens/scan_screen.dart';
import 'package:ecocycle/screens/settings_screen.dart';
import 'package:ecocycle/screens/splash_screen.dart';
import 'package:ecocycle/screens/upload_screen.dart';
import 'package:ecocycle/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecocycle',
      debugShowCheckedModeBanner: false,
      theme: modeGelap ? darkMode : lightMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/navigation': (context) => const Navigation(),
        '/home': (context) => const HomeScreen(),
        '/history': (context) => const HistoryScreen(),
        '/scan': (context) => const ScanScreen(),
        '/upload': (context) => const UploadScreen(),
        '/article': (context) => const ArticleScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
