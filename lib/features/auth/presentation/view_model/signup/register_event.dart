part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class NavigateLoginScreenEvent extends RegisterEvent {
  final BuildContext context;
  final Widget destination;

  const NavigateLoginScreenEvent({
    required this.context,
    required this.destination,
  });

  @override
  List<Object?> get props => [context, destination];
}

class RegisterUserEvent extends RegisterEvent {
  final BuildContext context;
  final String email;
  final String contactNo;
  final String username;
  final String password;
  final String? image;
  final String fullname;
  final DateTime? dob;
  final String? gender;
  final String? address;

  const RegisterUserEvent({
    required this.context,
    required this.email,
    required this.contactNo,
    required this.username,
    required this.password,
    this.image,
    required this.fullname,
    this.dob,
    this.gender,
    this.address,
  });

  @override
  List<Object?> get props => [
        context,
        email,
        contactNo,
        username,
        password,
        image,
        fullname,
        dob,
        gender,
        address,
      ];
}

class LoadImage extends RegisterEvent {
  final File file;

  const LoadImage({
    required this.file,
  });

  @override
  List<Object?> get props => [file];
}
