class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:300/api/v1/";

  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String getAllUser = 'auth/getAllUser';
  static const String deleteUser = 'auth/deleteUser';
  static const String getCurrentUser = 'auth/getCurrentUser';
  // static const String getUserById = 'auth/getCurrentUser';

  static const String imageUrl = 'http://10.0.2.2:3000/uploads';
  static const String uploadImage = 'auth/uploadImage';
}
