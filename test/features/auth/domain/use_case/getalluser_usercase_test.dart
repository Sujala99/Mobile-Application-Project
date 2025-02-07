import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_application_project/features/auth/domain/entity/auth_entity.dart';
import 'package:mobile_application_project/features/auth/domain/use_case/getalluser_usercase.dart';
import 'package:mocktail/mocktail.dart';

import '../../repository.mock.dart';

void main() {
  late AuthRepoMock repository;
  late GetAllUserUseCase useCase;

  setUp(() {
    repository = AuthRepoMock();
    useCase = GetAllUserUseCase(authRepository: repository);
  });

  final tAuth = AuthEntity(
    userId: '1',
    username: 'sujala',
    phone: '984762572',
    fullname: 'sujala rai',
    address: 'ilam',
    email: 'sjala@gmail.com',
    password: 'sujala',
  );

  final tAuth2 = AuthEntity(
    userId: '2',
    username: 'sujala',
    phone: '984762572',
    fullname: 'sujala rai',
    address: 'ilam',
    email: 'sjala@gmail.com',
    password: 'sujala',
  );
  final tAuths = [tAuth, tAuth2];

  test('should call the [AuthRepo.GetAllUser]', () async {
    when(() => repository.getUser()).thenAnswer(
      (_) async => Right(tAuths),
    );
    final result = await useCase();

    expect(result, Right(tAuths));

    verify(() => repository.getUser()).called(1);
  });
}
