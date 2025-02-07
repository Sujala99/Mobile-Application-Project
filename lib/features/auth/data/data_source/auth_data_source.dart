import 'dart:io';
import 'package:mobile_application_project/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthDataSource {
  /// Logs in a user with username or email and password
  Future<String> loginUser(String username, String password);

  /// Registers a new user
  Future<void> registerUser(AuthEntity userEntity);

  /// Retrieves the currently logged-in user
  // Future<AuthEntity> getCurrentUser();

  /// Uploads a profile picture and returns the URL
  Future<String> uploadProfilePicture(File file);

  /// Fetches a user by their user ID
  // Future<AuthEntity> getUserById(String userId);

  /// Deletes a user by their user ID
  // Future<void> deleteUserById(String userId);

  /// Retrieves a list of all users
  // Future<List<AuthEntity>> getAllUsers();
}
