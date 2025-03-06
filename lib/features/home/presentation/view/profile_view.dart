import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application_project/features/home/presentation/view_model/home_cubit.dart';
import 'package:mobile_application_project/features/home/presentation/view_model/home_state.dart';
import 'package:mobile_application_project/features/appointment/presentation/view/appointment_view.dart';
import 'package:mobile_application_project/features/doctor/presentation/view/doctor_view.dart';
import 'package:mobile_application_project/features/home/presentation/view/home_view.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/image1.jpeg'),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Sujala Rai',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Username: Sujala22',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24.0),
              ContactInfo(
                icon: Icons.phone,
                iconColor: Colors.green,
                text: '9706866904',
                backgroundColor: Colors.green[100]!,
              ),
              const SizedBox(height: 16.0),
              ContactInfo(
                icon: Icons.calendar_today,
                iconColor: Colors.orange,
                text: '22-07-2005',
                backgroundColor: Colors.orange[100]!,
              ),
              const SizedBox(height: 16.0),
              ContactInfo(
                icon: Icons.email,
                iconColor: Colors.blue,
                text: 'sujala@gmail.com',
                backgroundColor: Colors.blue[100]!,
              ),
              const SizedBox(height: 16.0),
              ContactInfo(
                icon: Icons.location_on,
                iconColor: Colors.red,
                text: 'Kathmandu',
                backgroundColor: Colors.red[100]!,
              ),
              const SizedBox(height: 24.0),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
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
  }

  Widget _buildDoctorCard(String name, String specialty, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Card(
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/image1.jpeg"),
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

  void _onBottomNavTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ),
        );
        break;
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
      default:
        break;
    }
  }
}

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final Color backgroundColor;

  const ContactInfo({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        const SizedBox(width: 16.0),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
