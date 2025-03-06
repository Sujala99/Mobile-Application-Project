// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mobile_application_project/features/doctor/presentation/view/doctor_view.dart';
// import 'package:mobile_application_project/features/appointment/presentation/view/appointment_view.dart';
// import 'package:mobile_application_project/features/auth/presentation/view/login_view.dart';
// import 'package:mobile_application_project/features/home/presentation/view/profile_view.dart';
// import 'package:mobile_application_project/features/home/presentation/view_model/home_cubit.dart';
// import 'package:mobile_application_project/features/home/presentation/view_model/home_state.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Minecare',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () {
//               _logout(context);
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(  // Allow scrolling for entire body
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Welcome To MindCare.",
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "Early protection for your family's health",
//                 style: TextStyle(fontSize: 16),
//               ),
//               const SizedBox(height: 20),

//               // Image below the Welcome Text
//               Container(
//                 height: 200,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/home.png"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 40),

//               // Top Doctors Section
//               const Text(
//                 "Top Doctors",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),

//               // Doctors in a Scrollable Container (Horizontal Scroll)
//               Container(
//                 height: 220,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       _buildDoctorCard("Dr. Sabina Maharjan ", "Psychologist", "doctor4.png"),
//                       _buildDoctorCard("Dr. Jane Smith", "Psychiatry", "doctor3.png"),
//                       _buildDoctorCard("Dr. Arpan Kumar Dhakal", "Sexuality and gender orientation-related issues", "doctor2.png"),
//                       _buildDoctorCard("Dr. Subhash Chandra Sharma ", "Psychologist", "doctor6.jpeg"),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 40),

//               // Testimonials Section
//               const Text(
//                 "What They Say About Us",
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               _buildTestimonial(
//                 context,
//                 "I have been a client to Bharat Sir since my first session in late 2016. He has always made me feel safe and supported, and I have recommended him to many of my friends, relatives, and connections.",
//                 "Anonymous",
//               ),
//               const SizedBox(height: 16),
//               _buildTestimonial(
//                 context,
//                 "I have given up on everything, I was depressed for 2 months and I tried an online therapy session with Dr. Pratima. She changed my life and gave me a ray of hope in my life. Now I am a manager of Marketing in a famous company.",
//                 "Aapsara",
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           return BottomNavigationBar(
//             backgroundColor: Colors.deepPurple,
//             items: const <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.dashboard),
//                 label: 'Dashboard',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.book),
//                 label: 'Doctor',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.group),
//                 label: 'Appointment',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.account_circle),
//                 label: 'Account',
//               ),
//             ],
//             currentIndex: state.selectedIndex,
//             selectedItemColor: Colors.white,
//             onTap: (index) {
//               context.read<HomeCubit>().onTabTapped(index);
//               _onBottomNavTap(context, index);
//             },
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildDoctorCard(String name, String specialty, String imageUrl) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 16.0),
//       child: Card(
//         child: Column(
//           children: [
//             CircleAvatar(
//               radius: 40,
//               backgroundImage: AssetImage("assets/images/$imageUrl"),
//             ),
//             const SizedBox(height: 8),
//             Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
//             Text(specialty),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTestimonial(BuildContext context, String message, String author) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           message,
//           style: TextStyle(fontSize: 18),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           author,
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }

//   void _logout(BuildContext context) {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => LoginView(),
//       ),
//     );
//   }

//   void _onBottomNavTap(BuildContext context, int index) {
//     switch (index) {
//       case 1:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const DoctorView(),
//           ),
//         );
//         break;
//       case 2:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const AppointmentView(),
//           ),
//         );
//         break;
//       case 3:
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>  ProfilePage(),
//           ),
//         );
//         break;
//       default:
//         break;
//     }
//   }
// }

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application_project/features/appointment/presentation/view/appointment_view.dart';
import 'package:mobile_application_project/features/doctor/presentation/view/doctor_view.dart';
import 'package:mobile_application_project/features/home/presentation/view/profile_view.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:mobile_application_project/features/auth/presentation/view/login_view.dart';
import 'package:mobile_application_project/features/home/presentation/view_model/home_cubit.dart';
import 'package:mobile_application_project/features/home/presentation/view_model/home_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const double shakeThreshold = 2.0; // Adjust sensitivity
  static const int shakeCooldownMs = 1500; // Prevent multiple triggers
  DateTime? _lastShakeTime;
  UserAccelerometerEvent? _previousEvent;
  late StreamSubscription<UserAccelerometerEvent> _accelerometerSubscription;

  @override
  void initState() {
    super.initState();
    _startShakeDetection();
  }

  void _startShakeDetection() {
    _accelerometerSubscription =
        userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      if (_previousEvent == null) {
        _previousEvent = event;
        return;
      }

      double deltaX = event.x - _previousEvent!.x;
      double deltaY = event.y - _previousEvent!.y;
      double deltaZ = event.z - _previousEvent!.z;

      double acceleration =
          sqrt(deltaX * deltaX + deltaY * deltaY + deltaZ * deltaZ);

      print("Acceleration: $acceleration"); // Debug log

      if (acceleration > shakeThreshold) {
        final now = DateTime.now();
        if (_lastShakeTime == null ||
            now.difference(_lastShakeTime!).inMilliseconds > shakeCooldownMs) {
          _lastShakeTime = now;
          _handleShake();
        }
      }

      _previousEvent = event;
    });
  }

  void _handleShake() {
    if (mounted) {
      context.read<HomeCubit>().logout(context); // Logout logic in HomeCubit
    }
  }

  @override
  void dispose() {
    _accelerometerSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Minecare',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.deepPurple,
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  _logout(context);
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome To MindCare.",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Early protection for your family's health",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),

                  // Image below the Welcome Text
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/home.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Top Doctors Section
                  const Text(
                    "Top Doctors",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // Doctors in a Scrollable Container (Horizontal Scroll)
                  Container(
                    height: 220,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildDoctorCard("Dr. Sabina Maharjan ", "Psychologist", "doctor4.png"),
                          _buildDoctorCard("Dr. Jane Smith", "Psychiatry", "doctor3.png"),
                          _buildDoctorCard("Dr. Arpan Kumar Dhakal", "Sexuality and gender orientation-related issues", "doctor2.png"),
                          _buildDoctorCard("Dr. Subhash Chandra Sharma ", "Psychologist", "doctor6.jpeg"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Testimonials Section
                  const Text(
                    "What They Say About Us",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildTestimonial(
                    context,
                    "I have been a client to Bharat Sir since my first session in late 2016. He has always made me feel safe and supported, and I have recommended him to many of my friends, relatives, and connections.",
                    "Anonymous",
                  ),
                  const SizedBox(height: 16),
                  _buildTestimonial(
                    context,
                    "I have given up on everything, I was depressed for 2 months and I tried an online therapy session with Dr. Pratima. She changed my life and gave me a ray of hope in my life. Now I am a manager of Marketing in a famous company.",
                    "Aapsara",
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return BottomNavigationBar(
                backgroundColor: Colors.deepPurple,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book),
                    label: 'Doctor',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.group),
                    label: 'Appointment',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle),
                    label: 'Account',
                  ),
                ],
                currentIndex: state.selectedIndex,
                selectedItemColor: Colors.white,
                onTap: (index) {
                  context.read<HomeCubit>().onTabTapped(index);
                  _onBottomNavTap(context, index);
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildDoctorCard(String name, String specialty, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Card(
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/$imageUrl"),
            ),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(specialty),
          ],
        ),
      ),
    );
  }

  Widget _buildTestimonial(BuildContext context, String message, String author) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          message,
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          author,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  void _logout(BuildContext context) {
    context.read<HomeCubit>().logout(context);
  }

  void _onBottomNavTap(BuildContext context, int index) {
    switch (index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DoctorView(),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AppointmentView(),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  ProfilePage(),
          ),
        );
        break;
      default:
        break;
    }
  }
}
