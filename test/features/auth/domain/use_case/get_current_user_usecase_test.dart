import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/auth/domain/entity/auth_entity.dart';
import 'package:mobile_application_project/features/auth/domain/repository/auth_repository.dart';
import 'package:mobile_application_project/features/auth/domain/use_case/get_current_user_usecase.dart';

// Mock Repository
class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late GetCurrentUserUseCase usecase;
  late MockAuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    usecase = GetCurrentUserUseCase(authRepository: repository);
  });

  const tUser = AuthEntity(
    userId: '1',
    username: 'testUser',
    email: 'test@example.com',
    image: 'https://example.com/profile.jpg',
    phone: '',
    fullname: '',
    address: '',
    password: '',
  );

  test('should return current user when repository call is successful',
      () async {
    // Arrange
    when(() => repository.getCurrentUser()).thenAnswer(
      (_) async => Right(tUser),
    );

    // Act
    final result = await usecase();

    // Assert
    expect(result, Right(tUser));
    verify(() => repository.getCurrentUser()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return a Failure when repository call fails', () async {
    // Arrange
    when(() => repository.getCurrentUser()).thenAnswer(
      (_) async => Left(ApiFailure(message: 'Failed to fetch user')),
    );

    // Act
    final result = await usecase();

    // Assert
    expect(result, Left(ApiFailure(message: 'Failed to fetch user')));
    verify(() => repository.getCurrentUser()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
