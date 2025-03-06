import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application_project/features/doctor/presentation/view/doctor_view.dart';
import 'package:mobile_application_project/features/home/presentation/view/profile_view.dart';
import 'package:mobile_application_project/features/home/presentation/view_model/home_cubit.dart';
import 'package:mobile_application_project/features/home/presentation/view_model/home_state.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment'),
        backgroundColor: Colors.deepPurple, // Set AppBar background to purple
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Make the column fill the width
          children: <Widget>[
            _buildAppointmentCard(
              doctorName: 'Dr. Sabina Maharjan',
              date: '3/04/2025',
              time: '17:00',
              status: 'Pending',
            ),
            _buildAppointmentCard(
              doctorName: 'Dr. Pratime Khatri',
              date: '3/10/2025',
              time: '14:30',
              status: 'Accepted',
            ),
            _buildAppointmentCard(
              doctorName: 'Dr. Missy Smith',
              date: '4/5/2025',
              time: '10:00',
              status: 'Rejected',
            ),
          ],
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

  Widget _buildAppointmentCard({
    required String doctorName,
    required String date,
    required String time,
    required String status,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              doctorName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 8),
            Text('📅 Date: $date', style: const TextStyle(fontSize: 16)),
            Text('⏰ Time: $time', style: const TextStyle(fontSize: 16)),
            Text(
              '📌 Status: $status',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _getStatusColor(status),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'accepted':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.black;
    }
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
            builder: (context) => ProfilePage(),
          ),
        );
        break;
      default:
        break;
    }
  }
}
