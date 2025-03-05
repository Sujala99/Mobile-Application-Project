import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/doctor/data/data_source/local_datasource/doctor_local_data_source.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';
import 'package:mobile_application_project/features/doctor/domain/repository/doctor_repository.dart';

class DoctorLocalRepository implements IDoctorRepository {
  final DoctorLocalDataSource _doctorLocalDataSource;

  DoctorLocalRepository({required DoctorLocalDataSource doctorLocalDataSource})
      : _doctorLocalDataSource = doctorLocalDataSource;

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctor() {
    try {
      return _doctorLocalDataSource.getDoctors().then(
        (value) {
          return Right(value);
        },
      );
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, DoctorEntity>> getDoctorDetail(String doctorId) {
    // TODO: implement getDoctorDetail
    throw UnimplementedError();
  }

  // @override
  // Future<Either<Failure, List<CourseEntity>>> getCourses() {
  //   try {
  //     return _courseLocalDataSource.getCourses().then(
  //       (value) {
  //         return Right(value);
  //       },
  //     );
  //   } catch (e) {
  //     return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
  //   }
  // }

  // @override
  // Future<Either<Failure, CourseEntity>> getCourseDetail(String courseId) {
  //   // TODO: implement getCourseDetail
  //   throw UnimplementedError();
  // }
}
