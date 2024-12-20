import 'package:flutter/material.dart';
import 'package:mobile_application_project/common/mysnackbar.dart'; // Snackbar utility

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  void _register() {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String phone = _phoneController.text.trim();
    String password = _passwordController.text;

    if (username.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty) {
      showMySnackBar(context, "All fields are required.", color: Colors.red);
      return;
    }
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      showMySnackBar(context, "Invalid email format.", color: Colors.red);
      return;
    }
    if (password.length < 6) {
      showMySnackBar(context, "Password must be at least 6 characters long.",
          color: Colors.red);
      return;
    }

    showMySnackBar(context, "Registration Successful!", color: Colors.green);
    Navigator.pushNamed(context, '/login'); // Redirect to Login Page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4E8FF), // Soft Lavender Background
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Main Heading
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3D0066), // Dark Purple
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Illustration
                  Image.asset(
                    'assets/images/login.png', // Replace with your illustration path
                    height: 200,
                  ),
                  const SizedBox(height: 30),

                  // Username Input
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Enter Username',
                      prefixIcon: const Icon(Icons.person_outline),
                      filled: true,
                      fillColor: Colors.white,
                      border: _inputBorder(),
                      enabledBorder: _inputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Email Input
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      prefixIcon: const Icon(Icons.email_outlined),
                      filled: true,
                      fillColor: Colors.white,
                      border: _inputBorder(),
                      enabledBorder: _inputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Phone Number Input
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Enter Phone Number',
                      prefixIcon: const Icon(Icons.phone_outlined),
                      filled: true,
                      fillColor: Colors.white,
                      border: _inputBorder(),
                      enabledBorder: _inputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password Input
                  TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: _inputBorder(),
                      enabledBorder: _inputBorder(),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Register Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(0),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF9370DB), Color(0xFF6A0DAD)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Bottom Text: Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF9C4DCC), // Medium Violet
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0xFFD4B5F0), // Soft Violet
      ),
    );
  }
}
