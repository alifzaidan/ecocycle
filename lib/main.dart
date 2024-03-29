import 'package:ecocycle/screens/home_screen.dart';
import 'package:ecocycle/screens/login_screen.dart';
import 'package:ecocycle/screens/navigation.dart';
import 'package:ecocycle/screens/onboarding_screen.dart';
import 'package:ecocycle/screens/register_screen.dart';
import 'package:ecocycle/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecocycle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/navigation': (context) => const Navigation(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
