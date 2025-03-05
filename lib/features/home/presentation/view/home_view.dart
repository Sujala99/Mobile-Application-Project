import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application_project/features/doctor/presentation/view/doctor_view.dart'; // Doctor page
import 'package:mobile_application_project/features/appointment/presentation/view/appointment_view.dart'; // Appointment page
import 'package:mobile_application_project/features/auth/presentation/view/login_view.dart';
import 'package:mobile_application_project/features/home/presentation/view/bottom_view/account_view.dart'; // Login page

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Minecare',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
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
      body: Padding(
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
                  image: AssetImage("assets/home.png"), // Local image
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
              height: 220, // Adjust the height for larger container
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildDoctorCard("Dr. Roshan Poudel", "Ophthalmologist", "assets/doctor1.png"),
                    _buildDoctorCard("Dr. Mina Hal", "Dermatologist", "https://dummyimage.com/100x100/000/fff"),
                    _buildDoctorCard("Dr. Pradeep Thapa", "Cardiologist", "https://dummyimage.com/100x100/000/fff"),
                    _buildDoctorCard("Dr. Suman Thapa", "Pediatrician", "https://dummyimage.com/100x100/000/fff"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: 0, // Replace with your dynamic index if needed
        selectedItemColor: Colors.white,
        onTap: (index) {
          _onBottomNavTap(context, index);
        },
      ),
    );
  }

  // Function to build doctor card
  Widget _buildDoctorCard(String name, String specialty, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Card(
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(imageUrl), // Display the image
            ),
            const SizedBox(height: 8),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(specialty),
          ],
        ),
      ),
    );
  }

  // Logout function
  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginView(),
      ),
    );
  }

  // Bottom navigation handling
  void _onBottomNavTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        // Dashboard page (You can navigate to a dashboard if needed)
        break;
      case 1:
        // Navigate to Doctor page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DoctorView(),
          ),
        );
        break;
      case 2:
        // Navigate to Appointment page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AppointmentView(),
          ),
        );
        break;
      case 3:
        // Navigate to Account page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AccountView(),
          ),
        );
        break;
      default:
        break;
    }
  }
}
