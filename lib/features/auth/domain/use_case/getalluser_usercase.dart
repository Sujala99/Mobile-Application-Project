import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/app/usecase/usecase.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/auth/domain/entity/auth_entity.dart';
import 'package:mobile_application_project/features/auth/domain/repository/auth_repository.dart';

class GetAllUserUseCase implements UsecaseWithoutParams<List<AuthEntity>> {
  final IAuthRepository authRepository;

  GetAllUserUseCase({required this.authRepository});

  @override
  Future<Either<Failure, List<AuthEntity>>> call() {
    return authRepository.getUser();
  }
}
