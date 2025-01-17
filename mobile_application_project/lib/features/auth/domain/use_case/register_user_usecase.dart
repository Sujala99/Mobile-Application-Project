import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String fullname;
  final String email;
  final String phone;
  final String city;
  final String username;
  final String password;

  const RegisterUserParams({
    required this.fullname,
    required this.email,
    required this.phone,
    required this.city,
    required this.username,
    required this.password,
  });

  //intial constructor
  const RegisterUserParams.initial({
    required this.fullname,
    required this.email,
    required this.phone,
    required this.city,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [fullname, email, phone, city, username, password];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) async {
    final authEntity = AuthEntity(
      fullname: params.fullname,
      email: params.email,
      phone: params.phone,
      city: params.city,
      username: params.username,
      password: params.password,
    );
    return repository.registerUser(authEntity);
  }
}
