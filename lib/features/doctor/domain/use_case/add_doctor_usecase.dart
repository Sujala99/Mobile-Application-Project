import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/doctor_repository.dart';

class CreateDoctorParams extends Equatable {
  final String fullname;
  final String email;
  final String username;
  final String password;
  final String? contactNo;
  final String? image;
  final DateTime? dob;
  final String? gender;
  final String? address;
  final String? specialization;
  final String? qualification;
  final int? experience;
  final String? fees;
  final String? availableSlots;
  final String? role;
  final String? description;

  const CreateDoctorParams({
    required this.fullname,
    required this.email,
    required this.username,
    required this.password,
    this.contactNo,
    this.image,
    this.dob,
    this.gender,
    this.address,
    this.specialization,
    this.qualification,
    this.experience,
    this.fees,
    this.availableSlots,
    this.role,
    this.description,
  });

  // Fixed empty constructor
  const CreateDoctorParams.empty()
      : fullname = '',
        email = '',
        username = '',
        password = '',
        contactNo = null,
        image = null,
        dob = null,
        gender = null,
        address = null,
        specialization = null,
        qualification = null,
        experience = null,
        fees = null,
        availableSlots = null,
        role = null,
        description = null;

  @override
  List<Object?> get props => [
        fullname,
        email,
        username,
        password,
        contactNo,
        image,
        dob,
        gender,
        address,
        specialization,
        qualification,
        experience,
        fees,
        availableSlots,
        role,
        description,
      ];
}

class AddDoctorUsecase implements UsecaseWithParams<void, CreateDoctorParams> {
  final IDoctorRepository _doctorRepository;

  AddDoctorUsecase({required IDoctorRepository doctorRepository})
      : _doctorRepository = doctorRepository;

  @override
  Future<Either<Failure, void>> call(CreateDoctorParams params) async {
    return await _doctorRepository.createDoctor(
      DoctorEntity(
        fullname: params.fullname,
        email: params.email,
        username: params.username,
        password: params.password,
        contactNo: params.contactNo,
        image: params.image,
        dob: params.dob,
        gender: params.gender,
        address: params.address,
        specialization: params.specialization,
        qualification: params.qualification,
        experience: params.experience,
        fees: params.fees,
        availableSlots: params.availableSlots,
        role: params.role,
        description: params.description,
      ),
    );
  }
}
