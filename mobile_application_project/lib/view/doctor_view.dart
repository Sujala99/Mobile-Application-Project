import 'package:flutter/material.dart';
import 'package:mobile_application_project/common/button_navigation_bar.dart';

class DoctorView extends StatefulWidget {
  const DoctorView({super.key});

  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Doctor'),
        ),
        body: const Text('this is doctorPage'),
        bottomNavigationBar: const ButtonNavigationBar()
        );
  }
}
