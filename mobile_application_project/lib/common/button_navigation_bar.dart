import 'package:flutter/material.dart';
import 'package:mobile_application_project/dashboard/appointment_view.dart';
import 'package:mobile_application_project/dashboard/chat_view.dart';
import 'package:mobile_application_project/dashboard/doctor_view.dart';
import 'package:mobile_application_project/dashboard/profile_view.dart';
import 'package:mobile_application_project/view/homepage.dart';

class ButtonNavigationBar extends StatefulWidget {
  const ButtonNavigationBar({super.key});

  @override
  State<ButtonNavigationBar> createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBar> {
  int _selectedIndex = 0;

  // List of screens corresponding to each BottomNavigationBarItem
  final List<Widget> _screens = [
    const Homepage(),
    const DoctorView(),
    const ChatView(),
    const AppointmentView(),
    const ProfileView(),
  ];

  // Function to handle BottomNavigationBar taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the currently selected screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Allows more than 3 items
        backgroundColor: Colors.purple.shade100, // Updated to a lighter shade
        selectedItemColor: Colors.purple, // Highlighted icon color
        unselectedItemColor: Colors.grey, // Non-selected icon color
        currentIndex: _selectedIndex, // Current active index
        onTap: _onItemTapped, // Handles taps
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Doctor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
