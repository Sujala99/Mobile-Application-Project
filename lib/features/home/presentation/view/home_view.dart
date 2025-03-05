import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application_project/features/home/presentation/view_model/home_cubit.dart';
import 'package:mobile_application_project/features/home/presentation/view_model/home_state.dart';

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
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "User: ${state.userId}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<HomeCubit>().logout(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Text(
                  "Welcome To MindCare.",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                );
              },
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
                  image: NetworkImage("https://your-image-url.com"), // Replace with your image URL
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

            // Dummy Doctor Data
            Expanded(
              child: ListView(
                children: [
                  _buildDoctorCard("Dr. Roshan Poudel", "Ophthalmologist", "https://dummyimage.com/100x100/000/fff"), // Replace with actual image URL
                  _buildDoctorCard("Dr. Mina Hal", "Dermatologist", "https://dummyimage.com/100x100/000/fff"), // Replace with actual image URL
                  _buildDoctorCard("Dr. Pradeep Thapa", "Cardiologist", "https://dummyimage.com/100x100/000/fff"), // Replace with actual image URL
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
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
            },
          );
        },
      ),
    );
  }

  // Function to build doctor card
  Widget _buildDoctorCard(String name, String specialty, String imageUrl) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl), // Display the image
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(specialty),
      ),
    );
  }
}
