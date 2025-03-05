import 'dart:io';

import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/core/network/local_network.dart';
import 'package:mobile_application_project/features/doctor/data/data_source/doctor_data_source.dart';
import 'package:mobile_application_project/features/doctor/data/model/doctor_hive_model.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';

class DoctorLocalDataSource implements IDoctorDataSource {
  final HiveService _hiveService;

  DoctorLocalDataSource({required HiveService hiveService})
      : _hiveService = hiveService;

  @override
  Future<List<DoctorEntity>> getDoctors() async {
    try {
      final doctorHiveModelList = await _hiveService.getDoctor();
      return DoctorHiveModel.toEntityList(doctorHiveModelList);
    } catch (e) {
      throw LocalDatabaseFailure(message: e.toString());
    }
  }

  @override
  Future<DoctorEntity> getDoctorDetailsById(String doctorId) {
    // TODO: implement getDoctorDetailsById
    throw UnimplementedError();
  }
}
