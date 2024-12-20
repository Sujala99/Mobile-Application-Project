import 'package:flutter/material.dart';
import 'package:mobile_application_project/dashboard/appointment_view.dart';
import 'package:mobile_application_project/dashboard/chat_view.dart';
import 'package:mobile_application_project/dashboard/doctor_view.dart';
import 'package:mobile_application_project/dashboard/profile_view.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const DoctorView(),
    const ChatView(),
    const AppointmentView(),
    const ProfileView(),
  ];

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTap,
        selectedItemColor: Colors.purple[300],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Doctors'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Appointments'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              "Welcome Back!",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                hintText: "Search doctors, clinics, etc.",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Top Doctors",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    doctorNames.length, // Dynamic length based on doctor list
                itemBuilder: (context, index) {
                  return DoctorCard(
                    key: ValueKey(
                        doctorNames[index]), // Use key to rebuild the widget
                    doctorName: doctorNames[index],
                    specialization: specializations[index],
                    rating: ratings[index],
                    image: doctorImages[doctorNames[index]]!,
                    onTap: () {
                      // Add navigation or any other functionality here
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final double rating;
  final String image; // Fix the image argument type
  final VoidCallback onTap;

  const DoctorCard({
    super.key,
    required this.doctorName,
    required this.specialization,
    required this.rating,
    required this.image,
    required this.onTap, // Fix the onTap argument
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                    'assets/images/doctor1.png'), // Use the passed image
              ),
              const SizedBox(height: 12),
              Text(
                doctorName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                specialization,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Dummy data for doctors
const List<String> doctorNames = [
  "Dr. Alex Foster",
  "Dr. Olivia Turner",
  "Dr. Ethan Reed",
  "Dr. Mia Harris",
  "Dr. Liam Scott",
];

const List<String> specializations = [
  "General Practitioner",
  "Cardiologist",
  "Orthopedic Surgeon",
  "Dermatologist",
  "Pediatrician",
];

const List<double> ratings = [
  4.5,
  4.8,
  4.7,
  4.6,
  4.9,
];

// Dummy images for doctors
const Map<String, String> doctorImages = {
  "Dr. Alex Foster": 'assets/images/doctor1.png',
  "Dr. Olivia Turner": 'assets/images/doctor2.png',
  "Dr. Ethan Reed": 'assets/images/doctor3.png',
  "Dr. Mia Harris": 'assets/images/doctor4.png',
  "Dr. Liam Scott": 'assets/images/doctor5.png',
};
