import 'package:flutter/material.dart';

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
              doctorName: 'Dr. Missy Smith',
              date: '2/25/2025',
              time: '17:56',
              status: 'Pending',
            ),
            _buildAppointmentCard(
              doctorName: 'Dr. John Doe',
              date: '3/10/2025',
              time: '14:30',
              status: 'Accepted',
            ),
            _buildAppointmentCard(
              doctorName: 'Dr. Alex Turner',
              date: '4/5/2025',
              time: '10:00',
              status: 'Rejected',
            ),
          ],
        ),
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
}