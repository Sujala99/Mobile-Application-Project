import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';

import '../../../../core/error/failure.dart';

abstract interface class IDoctorRepository {
  /// Fetch a list of all doctors
  Future<Either<Failure, List<DoctorEntity>>> getDoctors();

  /// Create a new doctor
  Future<Either<Failure, void>> createDoctor(DoctorEntity doctor);

  /// Get doctor details by ID
  Future<Either<Failure, DoctorEntity>> getDoctorById(String id, String? token);

  /// Update doctor details
  Future<Either<Failure, void>> updateDoctor(
      String id, DoctorEntity doctor, String? token);

  /// Delete a doctor by ID
  Future<Either<Failure, void>> deleteDoctor(String id, String? token);
}
