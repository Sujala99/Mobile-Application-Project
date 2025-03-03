import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entity/doctor_entity';
import '../repository/appointment_repository.dart';

class CreateDoctorParams extends Equatable {
  final String fullname;
  final String email;
  final String username;
  final String password;

  const CreateDoctorParams({
    required this.fullname,
    required this.email,
    required this.username,
    required this.password,
  });

  // Empty constructor
  const CreateDoctorParams.empty()
      : fullname = '_empty.string',
        email = '_empty.string',
        username = '_empty.string',
        password = '_empty.string';

  @override
  List<Object?> get props => [fullname, email, username, password];
}

class AddDoctorUsecase implements UsecaseWithParams<void, CreateDoctorParams> {
  final IDoctorRepository doctorRepository;

  AddDoctorUsecase({required this.doctorRepository});

  @override
  Future<Either<Failure, void>> call(CreateDoctorParams params) async {
    return await doctorRepository.createDoctor(
      DoctorEntity(
        fullname: params.fullname,
        email: params.email,
        username: params.username,
        password: params.password,
      ),
    );
  }
}
