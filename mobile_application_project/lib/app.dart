import 'package:flutter/material.dart';
import 'package:mobile_application_project/view/homepage.dart';
import 'package:mobile_application_project/view/login_view.dart';
import 'package:mobile_application_project/view/splash_screen_view.dart';
import 'package:mobile_application_project/view/register_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
        '/homepage': (context) => const Homepage(),
      },
    );
  }
}
