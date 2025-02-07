import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_application_project/app/shared_prefs/token_shared_prefs.dart';
import 'package:mobile_application_project/app/usecase/usecase.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/auth/domain/repository/auth_repository.dart';

class DeleteUserParams extends Equatable {
  final String userId;

  const DeleteUserParams({required this.userId});

  // Since it's only used for `userId`, you don't need all other fields.
  const DeleteUserParams.empty() : userId = '_empty.userId';

  @override
  List<Object?> get props => [userId];
}

class DeleteUsercase implements UsecaseWithParams<void, DeleteUserParams> {
  final IAuthRepository authRepository;
  final TokenSharedPrefs tokenSharedPrefs;

  DeleteUsercase({
    required this.authRepository,
    required this.tokenSharedPrefs,
  });

  @override
  Future<Either<Failure, void>> call(DeleteUserParams params) async {
    final token = await tokenSharedPrefs.getToken();

    return token.fold(
      (failure) {
        // Return failure if token retrieval failed
        return Left(failure);
      },
      (authToken) async {
        // Perform the delete user action with the token
        return await authRepository.deleteUser(params.userId);
      },
    );
  }
}
