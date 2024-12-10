import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.purple.withOpacity(0.5), // Semi-transparent overlay
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 130),
                  const Text(
                    'Register ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      hintText: "Phone number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.purple[300],
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'login',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: const Text(
                      //     'Forgot password',
                      //     style: TextStyle(
                      //       decoration: TextDecoration.underline,
                      //       fontSize: 18,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
