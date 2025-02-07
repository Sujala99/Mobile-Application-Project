part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class UploadImage extends RegisterEvent {
  final File file;

  const UploadImage({
    required this.file,
  });
}

class RegisterUser extends RegisterEvent {
  final BuildContext context;
  final String fullname;
  final String email;
  final String phone;
  final String address;
  final String username;
  final String password;
  final String? image;
  final DateTime? dob;
  final String? gender;

  const RegisterUser({
    required this.context,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.address,
    required this.username,
    required this.password,
    this.image,
    this.dob,
    this.gender,
  });
}
