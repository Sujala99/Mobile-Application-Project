import 'package:flutter/material.dart';
import 'package:mobile_application_project/common/mysnackbar.dart';
import 'package:mobile_application_project/theme/theme_data.dart'; // Import theme

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String validUsername = "admin@gmail.com";
  final String validPassword = "admin123";

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == validUsername && password == validPassword) {
      showMySnackBar(context, "Login Successful!", color: Colors.green);
      Navigator.pushNamed(context, '/homepage');
    } else {
      showMySnackBar(context, "Incorrect username or password.",
          color: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: getApplicationTheme(), // Use global theme
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Main Heading
                    Text(
                      "Welcome Back!",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: const Color(0xFF3D0066), // Dark Purple
                            fontWeight: FontWeight.bold,
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
                        hintStyle: const TextStyle(
                          color: Color(0xFFA8A8A8), // Medium Gray
                        ),
                        prefixIcon: const Icon(Icons.person_outline),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                          borderSide: const BorderSide(
                            color: Color(0xFFD4B5F0), // Soft Violet
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFD4B5F0), // Soft Violet
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password Input
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        hintStyle: const TextStyle(
                          color: Color(0xFFA8A8A8), // Medium Gray
                        ),
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: const Icon(Icons.visibility_off),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                          borderSide: const BorderSide(
                            color: Color(0xFFD4B5F0), // Soft Violet
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFD4B5F0), // Soft Violet
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _login,
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
                              'Log In',
                              style: TextStyle(
                                color: Colors.white, // White Text
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Bottom Text: Create Account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text(
                            'Create Account',
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
      ),
    );
  }
}
