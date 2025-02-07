import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application_project/features/auth/presentation/view/register_view.dart';
import 'package:mobile_application_project/features/auth/presentation/view_model/login/login_bloc.dart';
import '../../../home/presentation/view/home_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'kiran');
  final _passwordController = TextEditingController(text: 'test12345');

  final _gap = const SizedBox(height: 8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Brand Bold',
                      ),
                    ),
                    _gap,
                    TextFormField(
                      key: const ValueKey('username'),
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    _gap,
                    TextFormField(
                      key: const ValueKey('password'),
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      }),
                    ),
                    _gap,
                    // ElevatedButton(
                    //   onPressed: () async {
                    //     if (_formKey.currentState!.validate()) {
                    //       final username = _usernameController.text.trim();
                    //       final password = _passwordController.text.trim();
                    //
                    //       // Login using Dio API service
                    //       try {
                    //         final apiService = ApiService(Dio());
                    //         final user = await apiService.loginStudent(
                    //             username, password);
                    //
                    //         if (user != null) {
                    //           // Successfully authenticated
                    //           context.read<LoginBloc>().add(
                    //                 NavigateHomeScreenEvent(
                    //                   destination: HomeView(),
                    //                   context: context,
                    //                 ),
                    //               );
                    //         } else {
                    //           // Invalid credentials
                    //           showMySnackBar(
                    //             context: context,
                    //             message: 'Invalid email or password',
                    //             color: Color(0xFF9B6763),
                    //           );
                    //         }
                    //       } catch (e) {
                    //         showMySnackBar(
                    //           context: context,
                    //           message: 'An error occurred. Please try again.',
                    //           color: Color(0xFF9B6763),
                    //         );
                    //       }
                    //     }
                    //   },
                    //   child: const SizedBox(
                    //     height: 50,
                    //     child: Center(
                    //       child: Text(
                    //         'Login',
                    //         style: TextStyle(
                    //           fontSize: 18,
                    //           fontFamily: 'Brand Bold',
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final username = _usernameController.text.trim();
                          final password = _passwordController.text.trim();

                          context.read<LoginBloc>().add(
                                LoginUserEvent(
                                  username: username,
                                  password: password,
                                  context: context,
                                  destination: HomeView(),
                                ),
                              );
                        }
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand Bold',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      key: const ValueKey('registerButton'),
                      onPressed: () {
                        context.read<LoginBloc>().add(
                              NavigateRegisterScreenEvent(
                                destination: RegisterView(),
                                context: context,
                              ),
                            );
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Brand Bold',
                            ),
                          ),
                        ),
                      ),
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
