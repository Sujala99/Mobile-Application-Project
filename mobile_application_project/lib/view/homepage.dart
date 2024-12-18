import 'package:flutter/material.dart';
import 'package:mobile_application_project/common/button_navigation_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Top Section with Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              color: Colors.purple[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Let’s find your hope here!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Empty Space (Placeholder for Content)
            Expanded(
              child: Container(
                color: Colors.grey[100],
                child: const Center(
                  child: Text(
                    "This is home page",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
        // Bottom Navigation Bar
        bottomNavigationBar: const ButtonNavigationBar());
  }
}
