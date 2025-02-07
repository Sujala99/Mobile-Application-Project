import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String userId;
  final String username;
  final String phone;
  final String fullname;
  final DateTime? dob;
  final String? gender;
  final String address;
  final String? image;
  final String email;
  final String password;

  const AuthEntity({
    required this.userId,
    required this.username,
    required this.phone,
    required this.fullname,
    this.dob,
    this.gender,
    required this.address,
    this.image,
    required this.email,
    required this.password,
  });

  const AuthEntity.empty()
      : userId = '_empty.userId',
        username = '_empty.username',
        phone = '_empty.phone',
        fullname = '_empty.fullname',
        dob = null,
        gender = '_empty.gender',
        address = '_empty.address',
        image = '_empty.image',
        email = '_empty.email',
        password = '_empty.password';

  @override
  List<Object?> get props => [
        userId,
        username,
        phone,
        fullname,
        dob,
        gender,
        address,
        image,
        email,
        password
      ];
}
