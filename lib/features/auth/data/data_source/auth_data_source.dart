import 'dart:io';

import 'package:mobile_application_project/features/auth/domain/entity/auth_entity.dart';


abstract interface class IAuthDataSource {
  Future<String> loginUser(String username, String password);

  Future<void> registerUser(AuthEntity user);

  Future<AuthEntity> getCurrentUser();

  Future<String> uploadProfilePicture(File file);
}
