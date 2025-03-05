import 'package:flutter/material.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment'), // Set the app title to "Appointment"
      ),
      body: SingleChildScrollView( // Use SingleChildScrollView to allow scrolling if needed
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
          children: <Widget>[
            _buildAppointmentCard(
              doctorName: 'Dr. Missy Smith',
              date: '2/25/2025',
              time: '17:56',
              status: 'Pending',
            ),
            _buildAppointmentCard(
              doctorName: 'Dr. Missy Smith',
              date: '2/25/2025',
              time: '17:56',
              status: 'Pending',
            ),
            _buildAppointmentCard(
              doctorName: 'Unknown Doctor',
              date: '2/25/2025',
              time: '21:24',
              status: 'Accept',
            ),  _buildAppointmentCard(
              doctorName: 'Unknown Doctor',
              date: '2/25/2025',
              time: '21:24',
              status: 'Rejected',
            ),
            // Add more _buildAppointmentCard widgets as needed
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Set a background color
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
         BoxShadow(
            color: Colors.grey,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            doctorName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 4),
          Text('Date: $date'),
          Text('Time: $time'),
          Text('Status: $status'),
        ],
      ),
    );
  }
}