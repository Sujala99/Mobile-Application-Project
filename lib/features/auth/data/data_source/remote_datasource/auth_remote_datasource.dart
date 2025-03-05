import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_application_project/features/auth/domain/entity/auth_entity.dart';
import '../../../../../app/constants/api_endpoints.dart';
import '../../model/auth_api_model.dart';
import '../auth_data_source.dart';

class AuthRemoteDatasource implements IAuthDataSource {
  final Dio _dio;

  AuthRemoteDatasource(this._dio);

  @override
  // Future<void> registerUser(AuthEntity authEntity) async {
  //   try {
  //     // Convert entity to model
  //     var authApiModel = AuthApiModel.fromEntity(authEntity);
  //     var response = await _dio.post(
  //       ApiEndpoints.register,
  //       data: authApiModel.toJson(),
  //     );
  //     if (response.statusCode == 200) {
  //       return;
  //     } else {
  //       throw Exception(response.statusMessage);
  //     }
  //   } on DioException catch (e) {
  //     throw Exception(e.message);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  @override
  Future<AuthEntity> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  // @override
  // Future<String> loginUser(String username, String password) async {
  //   try {
  //     Response response = await _dio.post(ApiEndpoints.login, data: {
  //       "username": username,
  //       "password": password,
  //     });

  //     if (response.statusCode == 200) {
  //       final str = response.data['token'];
  //       return str;
  //     } else {
  //       throw Exception(response.statusMessage);
  //     }
  //   } on DioException catch (e) {
  //     throw Exception(e);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // @override
  // Future<String> uploadProfilePicture(File file) async {
  //   try {
  //     String fileName = file.path.split('/').last;
  //     FormData formData = FormData.fromMap(
  //       {
  //         'profilePicture':
  //             await MultipartFile.fromFile(file.path, filename: fileName),
  //       },
  //     );
  //     Response response = await _dio.post(
  //       ApiEndpoints.uploadImage,
  //       data: formData,
  //     );
  //     if (response.statusCode == 200) {
  //       return response.data['data'];
  //     } else {
  //       throw Exception(response.statusMessage);
  //     }
  //   } on DioException catch (e) {
  //     throw Exception(e);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }


Future<void> registerUser(AuthEntity authEntity) async {
try {
      var authApiModel = AuthApiModel.fromEntity(authEntity);
      var response = await _dio.post(
        ApiEndpoints.register,
        data: authApiModel.toJson(),
      );
      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  Future<String> loginUser(String username, String password) async {
    try {
      Response response = await _dio.post(ApiEndpoints.login, data: {
        "username": username,
        "password": password,
      });

      if (response.statusCode == 200) {
        final str = response.data['token'];
        return str;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

 Future<String> uploadProfilePicture(File file) async {
     try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'profilePicture': await MultipartFile.fromFile(file.path, filename: fileName),
        },
      );
      Response response = await _dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );
      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}
