class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:4000/";

  static const String login = "users/login"; // Corrected
  static const String register = "users/register";
  static const String getAllUser = 'users/getAllUser';
  static const String deleteUser = 'users/deleteUser';
  static const String getCurrentUser = 'users/getCurrentUser';
  // static const String getUserById = 'auth/getCurrentUser';

  static const String imageUrl = "http://10.0.2.2:4000/uploads/"; // Corrected
  static const String uploadImage = "users/uploadImage"; // Corrected

// doctor routes
  static const String addDoctor = 'doctors/addDoctor';
  static const String getAllDoctor = 'doctors/getAllDoctors';
  static const String getDoctorById = 'doctors//getDoctor/:id';
  static const String deleteDoctor = 'doctors/"/deleteDoctor/:id';
}
