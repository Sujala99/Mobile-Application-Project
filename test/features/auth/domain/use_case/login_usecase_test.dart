import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_applicaWOtion_project/core/error/failure.dart';
import 'package:mobile_application_project/features/auth/domain/use_case/login_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../../repository.mock.dart';
import '../../token.mock.dart';


void main() {
  late AuthRepoMock repository;
  late MockTokenSharedPrefs tokenSharedPrefs;
  late LoginUseCase loginUserUseCase;

  setUp(() {
    repository = AuthRepoMock();
    tokenSharedPrefs = MockTokenSharedPrefs();
    loginUserUseCase = LoginUseCase(tokenSharedPrefs, repository);
    registerFallbackValue('');
  });

  test('should call the repository with correct credentials and save token', () async {
    when(() => repository.loginUser(any(), any()))
        .thenAnswer((_) async => const Right('token'));

    when(() => tokenSharedPrefs.saveToken(any()))
        .thenAnswer((_) async => Future.value());

    final result = await loginUserUseCase(const LoginParams(username: 'sujala', password: 'sujala123'));

    expect(result, const Right('token'));
    verify(() => repository.loginUser('sujala', 'sujala123')).called(1);
    verify(() => tokenSharedPrefs.saveToken('token')).called(1);
  });
}
