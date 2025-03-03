import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity';
import '../../../../../core/error/failure.dart';
import '../../../domain/repository/appointment_repository.dart';
import '../../data_source/local_datasource/appointment_local_datasource.dart';

class DoctorLocalRepository implements IDoctorRepository {
  final DoctorLocalDataSource _doctorLocalDataSource;

  DoctorLocalRepository(this._doctorLocalDataSource);

  @override
  Future<Either<Failure, void>> createDoctor(DoctorEntity doctor) {
    // TODO: implement createDoctor
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteDoctor(String id, String? token) {
    // TODO: implement deleteDoctor
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, DoctorEntity>> getDoctorById(
      String id, String? token) {
    // TODO: implement getDoctorById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctors() {
    // TODO: implement getDoctors
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateDoctor(
      String id, DoctorEntity doctor, String? token) {
    // TODO: implement updateDoctor
    throw UnimplementedError();
  }
}
