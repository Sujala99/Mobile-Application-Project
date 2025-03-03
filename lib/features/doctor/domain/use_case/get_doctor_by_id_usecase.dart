import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/appointment/doctor/domain/repository/appointment_repository.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';

class GetCompanyById {
  final IDoctorRepository repository;

  GetCompanyById(this.repository);

  Future<Either<Failure, DoctorEntity>> call(String doctorId) async {
    return await repository.getDoctorById(doctorId);
  }
}
