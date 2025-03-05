import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? authId;
  final String email;
  final String? image;
  final String contactNo;
  final String username;
  final String password;
  final String fullname;
  final DateTime? dob;
  final String? gender;
  final String? address;

  const AuthEntity({
    this.authId,
    required this.email,
    this.image,
    required this.contactNo,
    required this.username,
    required this.password,
    required this.fullname,
    this.dob,
    this.gender,
    this.address,
  });

  @override
  List<Object?> get props => [
        authId,
        email,
        image,
        contactNo,
        username,
        password,
        fullname,
        dob,
        gender,
        address,
      ];
}
