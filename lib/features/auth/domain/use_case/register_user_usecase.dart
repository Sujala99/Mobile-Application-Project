import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_application_project/app/usecase/usecase.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/auth/domain/entity/auth_entity.dart';
import 'package:mobile_application_project/features/auth/domain/repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String fullname;
  final String email;
  final String phone;
  final String address;
  final String username;
  final String password;
  final DateTime? dob;
  final String? image;
  final String? gender;

//phone number, dob, gender, image,
  const RegisterUserParams({
    this.dob,
    this.image,
    this.gender,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.address,
    required this.username,
    required this.password,
  });

  // // Initial constructor (use this if you want an empty state for the object)
  // const RegisterUserParams.initial(this.dob, this.image, this.gender)
  //     : fullname = '',
  //       email = '',
  //       phone = '',
  //       address = '',
  //       username = '',
  //       password = '';

  const RegisterUserParams.empty()
      : fullname = '_empty.fullname',
        email = '_empty.email',
        phone = '_empty.phone',
        address = '_empty.address',
        username = '_empty.username',
        password = '_empty.password',
        dob = null, // Ensure null for DateTime?
        image = null,
        gender = null;

  @override
  List<Object?> get props => [
        fullname,
        email,
        phone,
        address,
        username,
        password,
        image,
        gender,
        dob,
      ];

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password,
      'image': image,
      'gender': gender,
      'dob': dob,
      'address': address,
    };
  }
}

class RegisterUserUseCase
    implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository userRepository;

  const RegisterUserUseCase({required this.userRepository});

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) async {
    final authEntity = AuthEntity(
      userId: '', // Will be assigned later, or can be left empty for now
      fullname: params.fullname,
      email: params.email,
      phone: params.phone,
      address: params.address,
      username: params.username,
      password: params.password,
      dob: params.dob, // Add defaults for optional fields
      gender: params.gender,
      image: params.image,
    );
    return await userRepository.registerUser(authEntity);
  }
}
