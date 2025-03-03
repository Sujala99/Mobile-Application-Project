import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_application_project/features/doctor/data/dto/get_all_doctor/get_all_doctors_dto.dart';
import 'package:mobile_application_project/features/doctor/data/model/doctor_hive_model.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';
import '../../../../../app/constants/api_endpoints.dart';
import '../../model/doctor_api_model.dart';
import '../doctor_data_source.dart';

class DoctorRemoteDatasource implements IDoctorDataSource {
  final Dio _dio;

  DoctorRemoteDatasource(this._dio);

  @override
  Future<void> addDoctor(DoctorEntity doctor) async {
    try {
      // Convert entity to model
      var batchApiModel = DoctorApiModel.fromEntity(doctor);
      var response = await _dio.post(
        ApiEndpoints.addDoctor,
        data: batchApiModel.toJson(),
      );
      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteDoctor(String id, String? token) async {
    try {
      var response = await _dio.delete(
        ApiEndpoints.deleteDoctor + id,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<DoctorHiveModel>> getAllDoctors() async {
    try {
      var response = await _dio.get(ApiEndpoints.getAllDoctor);
      if (response.statusCode == 200) {
        GetAllDoctorsDTO doctorAddDTO =
            GetAllDoctorsDTO.fromJson(response.data);

        // First, convert API models to entity list
        final entityList = DoctorApiModel.toEntityList(doctorAddDTO.data);

        // Then, convert entity list to HiveModel list
        final hiveModelList =
            entityList.map((e) => DoctorHiveModel.fromEntity(e)).toList();

        return hiveModelList;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<DoctorHiveModel> getDoctorById(String doctorId) {
    // TODO: implement getDoctorById
    throw UnimplementedError();
  }

  @override
  Future<void> updateDoctor(DoctorHiveModel doctor) {
    // TODO: implement updateDoctor
    throw UnimplementedError();
  }
}
