import 'dart:io';

import 'package:mobile_application_project/features/auth/domain/entity/auth_entity.dart';

import '../../../../../core/network/local_network.dart';
import '../../model/auth_hive_model.dart';
import '../auth_data_source.dart';

class AuthLocalDataSource implements IAuthDataSource {
  final HiveService _hiveService;

  AuthLocalDataSource(this._hiveService);

  @override
  Future<AuthEntity> getCurrentUser() {
    return Future.value(AuthEntity(
        authId: '1',
        email: '',
        contactNo: '',
        image: null,
        username: '',
        password: '', 
        fullname: ''));
  }

  @override
  Future<String> loginUser(String username, String password) async {
    try {
      await _hiveService.login(username, password);
      return Future.value("Success");
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> registerUser(AuthEntity user) async {
    try {
      // Convert AuthEntity to AuthHiveModel
      final authHiveModel = AuthHiveModel.fromEntity(user);

      await _hiveService.register(authHiveModel);
      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) {
    throw UnimplementedError();
  }
}
