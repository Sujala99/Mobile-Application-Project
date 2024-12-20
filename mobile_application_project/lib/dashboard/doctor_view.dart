import 'package:flutter/material.dart';

class DoctorView extends StatefulWidget {
  const DoctorView({super.key});

  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  final List<Map<String, String>> doctors = [
    {
      'name': 'Dr. Stefi Jessi',
      'specialization': 'Internal Doctor',
      'experience': '14 years',
      'fee': 'Nrs. 1000/hr',
      'image': 'assets/images/doctor1.png'
    },
    {
      'name': 'Dr. Marcus Horizon',
      'specialization': 'Psychologist',
      'experience': '11 years',
      'fee': 'Nrs. 1000/hr',
      'image': 'assets/images/doctor2.png'
    },
    {
      'name': 'Dr. Maria Elena',
      'specialization': 'Internal Doctor',
      'experience': '10 years',
      'fee': 'Nrs. 1000/hr',
      'image': 'assets/images/doctor3.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Doctors'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFF4E8FF),
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Proper back navigation
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      // Doctor's Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          doctor['image']!,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const SizedBox(
                              height: 80,
                              width: 80,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              height: 80,
                              width: 80,
                              child: Center(
                                child: Icon(Icons.broken_image, size: 40),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Doctor's Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor['name']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              doctor['specialization']!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Experience: ${doctor['experience']}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              doctor['fee']!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Book Appointment Button
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Appointment booked with ${doctor['name']}!'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          backgroundColor:
                              const Color.fromARGB(255, 125, 110, 128),
                          textStyle: const TextStyle(fontSize: 14),
                        ),
                        child: const Text('Book Appointment'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
