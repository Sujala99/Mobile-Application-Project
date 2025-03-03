import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/repository/doctor_repository.dart';
import '../../data_source/remote_datasource/doctor_remote_datasource.dart';

class DoctorRemoteRepository implements IDoctorRepository {
  final DoctorRemoteDatasource _doctorRemoteDatasource;

  DoctorRemoteRepository(this._doctorRemoteDatasource);

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
  Future<Either<Failure, DoctorEntity>> getDoctorById(String id) async {
    try {
      final companyResponse = await _doctorRemoteDatasource.getDoctorById(id);

      // Convert CompanyApiModel to CompanyEntity before returning
      final DoctorEntity doctor = companyResponse.toEntity();

      return Right(doctor);
    } catch (e) {
      return Left(ApiFailure(message: "Failed to fetch company details."));
    }
  }

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctors() async {
    try {
      final doctor = await _doctorRemoteDatasource.getAllDoctors();
      return Right(doctor.cast<DoctorEntity>());
    } catch (e) {
      return Left(ApiFailure(
        message: "Failed to fetch company list.",
      ));
    }
  }

  @override
  Future<Either<Failure, void>> updateDoctor(
      String id, DoctorEntity doctor, String? token) {
    // TODO: implement updateDoctor
    throw UnimplementedError();
  }
}
