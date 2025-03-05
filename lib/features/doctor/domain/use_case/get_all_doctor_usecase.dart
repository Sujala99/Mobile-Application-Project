import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/app/usecase/usecase.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';
import 'package:mobile_application_project/features/doctor/domain/repository/doctor_repository.dart';

class GetAllDoctorUsecase implements UsecaseWithoutParams<List<DoctorEntity>> {
  final IDoctorRepository _doctorRepository;

  GetAllDoctorUsecase({required IDoctorRepository doctorRepository})
      : _doctorRepository = doctorRepository;

  @override
  Future<Either<Failure, List<DoctorEntity>>> call() {
    return _doctorRepository.getDoctor();
  }
}
