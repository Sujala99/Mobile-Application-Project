part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class LoadCoursesAndBatches extends RegisterEvent {}

class RegisterStudent extends RegisterEvent {
  final BuildContext context;
  final String fullname;
  final String email;
  final String phone;
  final String city;
  final String username;
  final String password;

  const RegisterStudent({
    required this.context,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.city,
    required this.username,
    required this.password,
  });
}
