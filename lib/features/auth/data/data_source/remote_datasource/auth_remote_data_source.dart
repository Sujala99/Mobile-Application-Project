import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_application_project/app/constants/api_endpoints.dart';
import 'package:mobile_application_project/features/auth/data/data_source/auth_data_source.dart';
import 'package:mobile_application_project/features/auth/domain/entity/auth_entity.dart';

class AuthRemoteDataSource implements IAuthDataSource {
  final Dio _dio;

  AuthRemoteDataSource({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<String> loginUser(String username, String password) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.login,
        data: {
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return response.data['token']; // Assuming the response contains a token
      } else {
        throw Exception('Login failed');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> registerUser(AuthEntity userEntity) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.register,
        data: {
          "fullname": userEntity.fullname,
          "email": userEntity.email,
          "phone": userEntity.phone,
          "image": userEntity.image,
          "username": userEntity.username,
          "password": userEntity.password,
          "address": userEntity.address,
          "gender": userEntity.gender,
          "dob": userEntity.dob,
        },
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
  Future<String> uploadProfilePicture(File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'profilePicture': await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
        },
      );

      Response response = await _dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );

      if (response.statusCode == 200) {
        // Extract the image name from the response
        final str = response.data['data'];

        return str;
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
