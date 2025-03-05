// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:mobile_application_project/features/auth/data/repository/auth_remote_repository/auth_remote_repository.dart';

// import '../../../../app/usecase/usecase.dart';
// import '../../../../core/error/failure.dart';
// import '../entity/auth_entity';
// import '../repository/auth_repository.dart';

// class RegisterUserParams extends Equatable {
//   final String email;
//   final String? image;
//   final String contactNo;
//   final String username;
//   final String password;
//   final String fullname;
//   final DateTime? dob;
//   final String? gender;
//   final String? address;

//   const RegisterUserParams({
//     required this.email,
//     this.image,
//     required this.contactNo,
//     required this.username,
//     required this.password,
//     required this.fullname,
//     this.dob,
//     this.gender,
//     this.address,
//   });

//   // Initial Constructor
//   const RegisterUserParams.initial()
//       : email = '',
//         image = null,
//         contactNo = '',
//         username = '',
//         password = '',
//         fullname = '',
//         dob = null,
//         gender = null,
//         address = null;

//   @override
//   List<Object?> get props => [
//         email,
//         image,
//         contactNo,
//         username,
//         password,
//         fullname,
//         dob,
//         gender,
//         address
//       ];
// }

// class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
//   final IAuthRepository repository;

//   RegisterUseCase(this.repository);

//   @override
//   Future<Either<Failure, void>> call(RegisterUserParams params) {
//     final authEntity = AuthEntity(
//       email: params.email,
//       image: params.image,
//       contactNo: params.contactNo,
//       username: params.username,
//       password: params.password,
//       fullname: params.fullname,
//       dob: params.dob,
//       gender: params.gender,
//       address: params.address,
//     );
//     return repository.registerUser(authEntity);
//   }
// }


import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_application_project/features/auth/data/repository/auth_remote_repository/auth_remote_repository.dart';
import 'package:mobile_application_project/features/auth/domain/entity/auth_entity.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String email;
  final String? image;
  final String contactNo;
  final String username;
  final String password;
  final String fullname;
  final DateTime? dob;
  final String? gender;
  final String? address;

  const RegisterUserParams({
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

  // Initial Constructor
  const RegisterUserParams.initial()
      : email = '',
        image = null,
        contactNo = '',
        username = '',
        password = '',
        fullname = '',
        dob = null,
        gender = null,
        address = null;

  @override
  List<Object?> get props => [
        email,
        image,
        contactNo,
        username,
        password,
        fullname,
        dob,
        gender,
        address
      ];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      email: params.email,
      image: params.image,  // Include the image
      contactNo: params.contactNo,
      username: params.username,
      password: params.password,
      fullname: params.fullname,
      dob: params.dob,
      gender: params.gender,
      address: params.address,
    );
    return repository.registerUser(authEntity);  // Call repository to register user
  }
}
