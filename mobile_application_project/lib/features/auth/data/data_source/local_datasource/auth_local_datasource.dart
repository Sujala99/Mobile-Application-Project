import 'package:softwarica_student_management_bloc/core/network/local_network.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/data_source/auth_data_source.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/model/auth_hive_model.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';

class AuthLocalDataSource implements IAuthDataSource {
  final HiveService _hiveService;

  AuthLocalDataSource(this._hiveService);
  @override
  Future<AuthEntity> getCurrentUser() {
    return Future.value(AuthEntity(
      userId: "1",
      fullname: "",
      email: "",
      phone: "",
      city: "",
      username: "",
      password: "",
    ));
  }

  @override
  Future<String> loginUser(String identifier, String password) async {
    try {
      var user = await _hiveService.login(identifier, password);
      if (user != null) {
        return Future.value("Login Successful");
      } else {
        throw Exception("Invalid credentials");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> registerUser(AuthEntity user) async {
    try {
      final authHiveModel = AuthHiveModel.fromEntity(user);
      await _hiveService.register(authHiveModel);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
//   //  @override
//   // Future<String> uploadProfilePicture(File file) {
//   //   throw UnimplementedError();
//   // }
// }

// class AuthLocalDataSource implements IAuthDataSource {
//   final HiveService _hiveService;

//   AuthLocalDataSource(this._hiveService);

//   @override
//   Future<AuthEntity> getCurrentUser() async {
//     try {
//       var authModels = await _hiveService.getAllAuth();
//       if (authModels.isNotEmpty) {
//         return authModels.first.toEntity(); // Convert to domain entity
//       }
//       throw Exception("No user found");
//     } catch (e) {
//       throw Exception("Failed to get current user: ${e.toString()}");
//     }
//   }

//   @override
//   Future<String> loginUser(String identifier, String password) async {
//     var user = await _hiveService.login(identifier, password);
//     if (user != null) {
//       return "Login Successful"; // Or return token if applicable
//     }
//     throw Exception("Invalid credentials");
//   }

//   @override
//   Future<void> registerUser(AuthEntity user) async {
//     try {
//       final authHiveModel = AuthHiveModel.fromEntity(user);
//       await _hiveService.register(authHiveModel);
//     } catch (e) {
//       throw Exception("Registration failed: ${e.toString()}");
//     }
//   }
// }
