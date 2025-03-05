import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mobile_application_project/app/constants/api_endpoints.dart';
import 'package:mobile_application_project/features/doctor/data/data_source/doctor_data_source.dart';
import 'package:mobile_application_project/features/doctor/data/dto/get_all_doctor_details_dto.dart';
import 'package:mobile_application_project/features/doctor/data/dto/get_all_doctor_dto.dart';
import 'package:mobile_application_project/features/doctor/data/model/doctor_api_model.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';

class DoctorRemoteDatasource implements IDoctorDataSource {
  final Dio _dio;

  DoctorRemoteDatasource(this._dio);

  @override
  Future<DoctorEntity> getDoctorDetailsById(String doctorId) async {
    try {
      // var response = await _dio.get("${ApiEndpoints.getDoctorById}/$doctorId");
      final response = await _dio.get(
          "${ApiEndpoints.baseUrl}${ApiEndpoints.getDoctorById(doctorId)}");

      print("Raw API Response: ${response.data}"); // ✅ Debugging

      if (response.statusCode == 200 && response.data != null) {
        // ✅ Ensure response is correctly formatted
        final json = response.data as Map<String, dynamic>;

        final doctorDTO = GetDoctorDetailsByIdDTO.fromJson(
            json); // ✅ Directly parse JSON object
        return doctorDTO.toDomain(); // ✅ Convert DTO to domain entity
      } else {
        throw Exception(
            "Failed to fetch course details. Status: ${response.statusCode}");
      }
    } on DioException catch (e) {
      print("Dio Error: ${e.message}");
      throw Exception("Dio Error: ${e.message}");
    } catch (e) {
      print("Error: ${e.toString()}");
      throw Exception("Error: ${e.toString()}");
    }
  }

  @override
  Future<List<DoctorEntity>> getDoctors() async {
    try {
      var response = await _dio.get(ApiEndpoints.getAllDoctor);
      if (response.statusCode == 200) {
        // Convert API response to DTO
        var doctorDTO =
            GetAllDoctorDTO.fromJson(response.data as Map<String, dynamic>);
        // Convert DTO to Entity
        return DoctorApiModel.toEntityList(doctorDTO.doctors);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
