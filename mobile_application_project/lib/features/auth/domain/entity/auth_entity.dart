import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String fullname;
  final String email;
  final String phone;
  final String city;
  final String username;
  final String password;

  const AuthEntity({
    this.userId,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.city,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [userId, fullname, email, phone, city, username, password];
}
