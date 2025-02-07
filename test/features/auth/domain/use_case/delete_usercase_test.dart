import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/auth/domain/use_case/delete_usercase.dart';
import 'package:mocktail/mocktail.dart';

import '../../repository.mock.dart';
import '../../token.mock.dart';

void main() {
  late AuthRepoMock repository;
  late MockTokenSharedPrefs tokenSharedPrefs;
  late DeleteUsercase usecase;

  setUp(() {
    repository = AuthRepoMock();
    tokenSharedPrefs = MockTokenSharedPrefs();
    usecase = DeleteUsercase(
      authRepository: repository,
      tokenSharedPrefs: tokenSharedPrefs,
    );
  });

  test('should delete user using id', () async {
    // Arrange
    const tAuthId = '1';
    const token = 'token';
    final deleteUserParams = DeleteUserParams(userId: tAuthId);

    when(() => tokenSharedPrefs.getToken()).thenAnswer(
      (_) async => Right(token),
    );

    when(() => repository.deleteUser(any())).thenAnswer(
      (_) async => Right(null),
    );

    // Act
    final result = await usecase(deleteUserParams);

    // Assert
    expect(result, Right(null));

    // Verify interactions
    verify(() => tokenSharedPrefs.getToken()).called(1);
    verify(() => repository.deleteUser(tAuthId)).called(1);

    verifyNoMoreInteractions(repository);
    verifyNoMoreInteractions(tokenSharedPrefs);
  });

  test('should return failure if user is not found', () async {
    // Arrange
    const tAuthId = 'invalid_id';
    const token = 'token';
    final deleteUserParams = DeleteUserParams(userId: tAuthId);

    when(() => tokenSharedPrefs.getToken()).thenAnswer(
      (_) async => Right(token),
    );

    when(() => repository.deleteUser(any())).thenAnswer(
      (_) async => Left(ApiFailure(message: 'User not found')),
    );

    // Act
    final result = await usecase(deleteUserParams);

    // Assert
    expect(result, Left(ApiFailure(message: 'User not found')));

    // Verify interactions
    verify(() => tokenSharedPrefs.getToken()).called(1);
    verify(() => repository.deleteUser(tAuthId)).called(1);

    verifyNoMoreInteractions(repository);
    verifyNoMoreInteractions(tokenSharedPrefs);
  });
}
