import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/doctor/data/data_source/remote_datasource/doctor_remote_datasource.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';
import 'package:mobile_application_project/features/doctor/domain/repository/doctor_repository.dart';

class DoctorRemoteRepository implements IDoctorRepository {
  final DoctorRemoteDatasource _doctorRemoteDataSource;

  DoctorRemoteRepository(this._doctorRemoteDataSource);

  @override
  Future<Either<Failure, List<DoctorEntity>>> getDoctor() async {
    try {
      final courses = await _doctorRemoteDataSource.getDoctors();
      return Right(courses);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, DoctorEntity>> getDoctorDetail(String doctorId) async {
    try {
      final doctorData =
          await _doctorRemoteDataSource.getDoctorDetailsById(doctorId);
      return Right(doctorData);
    } on SocketException {
      return Left(ApiFailure(message: "No Internet Connection"));
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
    
  }

  // @override
  // Future<Either<Failure, List<CourseEntity>>> getCourses() async {
  //   try {
  //     final courses = await _courseRemoteDataSource.getCourses();
  //     return Right(courses);
  //   } catch (e) {
  //     return Left(ApiFailure(message: e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, CourseEntity>> getCourseDetail(String courseId) async {
  //   try {
  //     final courseData = await _courseRemoteDataSource.getCourseDetailsById(courseId);
  //     return Right(courseData);
  //   } on SocketException {
  //     return Left(ApiFailure(message: "No Internet Connection"));
  //   } catch (e) {
  //     return Left(ApiFailure(message: e.toString()));
  //   }
  // }
}
