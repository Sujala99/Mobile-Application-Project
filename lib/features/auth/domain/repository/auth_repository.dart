import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/features/auth/domain/entity/auth_entity.dart';

import '../../../../core/error/failure.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, void>> registerUser(AuthEntity user);

  Future<Either<Failure, String>> loginUser(String username, String password);

  Future<Either<Failure, String>> uploadProfilePicture(File file);

  Future<Either<Failure, AuthEntity>> getCurrentUser();

}
