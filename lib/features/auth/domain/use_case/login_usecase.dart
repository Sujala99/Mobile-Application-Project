import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_application_project/app/shared_prefs/token_shared_prefs.dart';
import 'package:mobile_application_project/app/usecase/usecase.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/auth/domain/repository/auth_repository.dart';

class LoginUserParams extends Equatable {
  final String username;
  final String password;

  const LoginUserParams({
    required this.username,
    required this.password,
  });

  // Initial Constructor
  const LoginUserParams.initial()
      : username = '',
        password = '';

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}

class LoginUserUseCase implements UsecaseWithParams<String, LoginUserParams> {
  final IAuthRepository userRepository;
  final TokenSharedPrefs tokenSharedPrefs;

  LoginUserUseCase(this.userRepository, this.tokenSharedPrefs);

  @override
  Future<Either<Failure, String>> call(LoginUserParams params) async {
    return userRepository
        .loginUser(
      params.username,
      params.password,
    )
        .then((value) {
      return value.fold(
        (failure) => Left(failure),
        (token) {
          tokenSharedPrefs.saveToken(token);
          // tokenSharedPrefs.getToken().then((value) {
          //   print(value);
          // });
          return Right(token);
        },
      );
    });
  }
}
