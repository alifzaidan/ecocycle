import 'dart:convert';

import 'package:ecocycle/firebase_options.dart';
import 'package:ecocycle/helper/local_notification_helper.dart';
import 'package:ecocycle/helper/push_notification_helper.dart';
import 'package:ecocycle/screens/login_screen.dart';
import 'package:ecocycle/screens/navigation.dart';
import 'package:ecocycle/screens/onboarding_screen.dart';
import 'package:ecocycle/screens/register_screen.dart';
import 'package:ecocycle/screens/splash_screen.dart';
import 'package:ecocycle/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print("Beberapa Notifikasi Berhasil Masuk");
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.notification != null) {
      print("Notifikasi Latar Belakang Ditekan");
      navigatorKey.currentState!.push(MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      ));
    }
  });

  PushNotifications.init();

  if (!kIsWeb) {
    PushNotifications.localNotificationInit();
  }

  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    String payloadData = jsonEncode(message.data);
    print("Mendapatkan Notifikasi di dalam aplikasi");
    if (message.notification != null) {
      if (kIsWeb) {
        PushNotifications.showNotification(
            title: message.notification!.title!,
            body: message.notification!.body!);
      } else {
        PushNotifications.showSimpleNotification(
            title: message.notification!.title!,
            body: message.notification!.body!,
            payload: payloadData);
      }
    }
  });

  final RemoteMessage? message =
      await FirebaseMessaging.instance.getInitialMessage();

  if (message != null) {
    print("Meluncurkan aplikasi dari notifikasi latar belakang");
    Future.delayed(const Duration(seconds: 1), () {
      navigatorKey.currentState!.push(MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      ));
    });
  }

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
      },
    );
  }
}
