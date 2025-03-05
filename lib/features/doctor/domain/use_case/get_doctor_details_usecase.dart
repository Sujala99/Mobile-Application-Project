import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/app/usecase/usecase.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';
import 'package:mobile_application_project/features/doctor/domain/repository/doctor_repository.dart';

class GetDoctorDetailUseCase
    implements UsecaseWithParams<DoctorEntity, String> {
  final IDoctorRepository _doctorRepository;

  GetDoctorDetailUseCase({required IDoctorRepository doctorRepository})
      : _doctorRepository = doctorRepository;

  @override
  Future<Either<Failure, DoctorEntity>> call(String doctorId) {
    return _doctorRepository.getDoctorDetail(doctorId);
  }
}
