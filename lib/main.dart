import 'package:flutter/material.dart';
import 'package:mobile_application_project/app/app.dart';
import 'package:mobile_application_project/app/di/di.dart';
import 'package:mobile_application_project/core/network/local_network.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hiveService = HiveService();
  await hiveService.init();
  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(
    App(),
  );
}
