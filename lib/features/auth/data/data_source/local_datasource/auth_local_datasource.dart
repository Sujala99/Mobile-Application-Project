import 'dart:io';
import 'package:hive/hive.dart';
import 'package:mobile_application_project/core/network/local_network.dart';
import 'package:mobile_application_project/features/auth/data/data_source/auth_data_source.dart';
import 'package:mobile_application_project/features/auth/domain/entity/auth_entity.dart';

class AuthLocalDataSource implements IAuthDataSource {
  final Box authBox = Hive.box('authBox');

  AuthLocalDataSource(HiveService hiveService);

  @override
  Future<String> loginUser(String username, String password) async {
    final authEntity = authBox.values.firstWhere(
      (user) => user.username == username && user.password == password,
      orElse: () => null,
    );
    if (authEntity != null) {
      return authEntity.userId;
    }
    throw Exception('Invalid credentials');
  }

  @override
  Future<void> registerUser(AuthEntity userEntity) async {
    await authBox.put(userEntity.userId, userEntity);
  }



  @override
  Future<String> uploadProfilePicture(File file) async {
    // Handle file upload here and return the URL
    // You can store the file in a directory and return the file path or URL
    throw UnimplementedError();
  }



}
