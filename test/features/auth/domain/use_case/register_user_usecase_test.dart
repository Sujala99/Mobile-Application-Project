// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mobile_application_project/features/auth/domain/entity/auth_entity.dart';
// import 'package:mobile_application_project/features/auth/domain/use_case/register_user_usecase.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../repository.mock.dart';

// void main() {
//   late AuthRepoMock repository;
//   late RegisterUserUseCase usecase;

//   setUp(() {
//     repository = AuthRepoMock();
//     usecase = RegisterUserUseCase(userRepository: repository);
//     registerFallbackValue(AuthEntity.empty());
//   });

//   final params = RegisterUserParams.empty();

//   test('should call the [AuthRepo.registerUser]', () async {
//     when(() => repository.registerUser(any())).thenAnswer(
//       (_) async => Right(null),
//     );

//     final result = await usecase(params);

//     expect(result, Right(null));

//     verify(() => repository.registerUser(any())).called(1);

//     verifyNoMoreInteractions(repository);
//   });
// }
