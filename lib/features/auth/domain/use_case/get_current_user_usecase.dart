import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/app/usecase/usecase.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/auth/domain/entity/auth_entity.dart';
import 'package:mobile_application_project/features/auth/domain/repository/auth_repository.dart';

class GetCurrentUserUseCase implements UsecaseWithoutParams<AuthEntity> {
  final IAuthRepository authRepository;

  GetCurrentUserUseCase({required this.authRepository});

  @override
  Future<Either<Failure, AuthEntity>> call() {
    return authRepository.getCurrentUser();
  }
}
