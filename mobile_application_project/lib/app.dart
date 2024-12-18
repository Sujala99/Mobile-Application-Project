import 'package:flutter/material.dart';
import 'package:mobile_application_project/common/button_navigation_bar.dart';
import 'package:mobile_application_project/view/doctor_view.dart';
import 'package:mobile_application_project/view/homepage.dart';
import 'package:mobile_application_project/view/login_view.dart';
import 'package:mobile_application_project/view/onboarding_view.dart';
import 'package:mobile_application_project/view/profile_view.dart';
import 'package:mobile_application_project/view/register_view.dart';
import 'package:mobile_application_project/view/splash_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/profile',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboard': (context) => const OnboardingView(),
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
        '/homepage': (context) => const Homepage(),
        '/profile': (context) => const ProfileView(),
        '/navbar': (context) => const ButtonNavigationBar(),
        '/doctor': (context) => const DoctorView(),
      },
    );
  }
}
