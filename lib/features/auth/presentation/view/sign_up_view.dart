import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../view_model/signup/register_bloc.dart';
import 'login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactNoController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _dobController = TextEditingController();
  bool _isPasswordVisible = false;
  String? _selectedGender;
  DateTime? _selectedDate;

  checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  File? _img;
  Future _browseImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
          context.read<RegisterBloc>().add(
                LoadImage(file: _img!),
              );
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _contactNoController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  String? _validateFullname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is required';
    }
    return null;
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validateContact(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? _validateDob(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date of Birth is required';
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    }
    return null;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('MindCare', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple, // Light purple background
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple, // Darker purple
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.grey[300],
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  checkCameraPermission();
                                  _browseImage(ImageSource.camera);
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.camera),
                                label: const Text('Camera'),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  _browseImage(ImageSource.gallery);
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.image),
                                label: const Text('Gallery'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.purple[50], // Lighter purple
                      backgroundImage: _img != null
                          ? FileImage(_img!)
                          : const AssetImage('assets/images/profile.png')
                              as ImageProvider,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Profile Picture'),
                const SizedBox(height: 20.0),
                _buildTextField(
                  controller: _fullnameController,
                  hintText: 'Full Name',
                  validator: _validateFullname,
                  prefixIcon: const Icon(Icons.person),
                ),
                _buildTextField(
                  controller: _usernameController,
                  hintText: 'Username',
                  validator: _validateUsername,
                  prefixIcon: const Icon(Icons.person_outline),
                ),
                _buildTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  validator: _validatePassword,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.purple[800], // Darker purple
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                        _passwordController.text =
                            _isPasswordVisible
                                ? _passwordController.text
                                : _passwordController.text.split('').reversed.join().replaceAll(RegExp(r"[^a-zA-Z0-9]"), "");
                      });
                    },
                  ),
                ),
                _buildTextField(
                  controller: _dobController,
                  hintText: 'Date of Birth',
                  validator: _validateDob,
                  prefixIcon: const Icon(Icons.calendar_today),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ),
                _buildTextField(
                  controller: _addressController,
                  hintText: 'Address',
                  validator: _validateAddress,
                  prefixIcon: const Icon(Icons.location_on),
                ),
                _buildTextField(
                  controller: _contactNoController,
                  hintText: 'Phone',
                  validator: _validateContact,
                  prefixIcon: const Icon(Icons.phone),
                ),
                _buildTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  validator: _validateEmail,
                  prefixIcon: const Icon(Icons.email),
                ),
                _buildTextField(
                  controller: TextEditingController(text: _selectedGender ?? ''),
                  hintText: 'Gender',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Gender is required';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.wc),
                  suffixIcon: DropdownButton<String>(
                    value: _selectedGender,
                    items: ['Male', 'Female', 'Other']
                        .map((gender) => DropdownMenuItem<String>(
                              value: gender,
                              child: Text(gender),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    icon: const Icon(Icons.arrow_drop_down),
                    iconEnabledColor: Colors.purple[800], // Darker purple
                    iconDisabledColor: Colors.purple[800], // Darker purple
                  ),
                ),
                const SizedBox(height: 24.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final registerState = context.read<RegisterBloc>().state;
                        context.read<RegisterBloc>().add(
                              RegisterUserEvent(
                                context: context,
                                fullname: _fullnameController.text,
                                username: _usernameController.text,
                                email: _emailController.text,
                                contactNo: _contactNoController.text,
                                password: _passwordController.text,
                                address: _addressController.text,
                                dob: _selectedDate,
                                gender: _selectedGender ?? '',
                                image: registerState.imageName,
                              ),
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[800], // Darker purple
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'REGISTER',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginView()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[50], // Lighter purple
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.purple), // Darker purple
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String? Function(String?) validator,
    bool obscureText = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple[50], // Lighter purple
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          validator: validator,
        ),
      ),
    );
  }
}