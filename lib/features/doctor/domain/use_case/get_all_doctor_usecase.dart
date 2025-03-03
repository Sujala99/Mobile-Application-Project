import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';
import '../repository/doctor_repository.dart';

class GetAllDoctorUseCase implements UsecaseWithoutParams<List<DoctorEntity>> {
  final IDoctorRepository doctorRepository;

  GetAllDoctorUseCase({required this.doctorRepository});

  @override
  Future<Either<Failure, List<DoctorEntity>>> call() {
    return doctorRepository.getDoctors();
  }
}
