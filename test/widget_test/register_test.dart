// import 'dart:io';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mobile_application_project/core/error/failure.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:mobile_application_project/features/auth/domain/use_case/register_user_usecase.dart';
// import 'package:mobile_application_project/features/auth/domain/use_case/upload_image_usecase.dart';
// import 'package:mobile_application_project/features/auth/presentation/view_model/register/register_bloc.dart';

// import '../features/auth/presentation/view_model/register/register_bloc_test.dart';

// class MockRegisterUserUseCase extends Mock implements RegisterUserUseCase {}

// class MockUploadImageUseCase extends Mock implements UploadImageUsecase {}

// void main() {
//   late RegisterBloc registerBloc;
//   late MockRegisterUserUseCase mockRegisterUserUseCase;
//   late MockUploadImageUseCase mockUploadImageUseCase;

//   setUp(() {
//     mockRegisterUserUseCase = MockRegisterUserUseCase();
//     mockUploadImageUseCase = MockUploadImageUseCase();
//     registerBloc = RegisterBloc(
//       registerUserUseCase: mockRegisterUserUseCase,
//       uploadImageUsecase: mockUploadImageUseCase,
//     );
//   });

//   tearDown(() {
//     registerBloc.close();
//   });

//   test('Initial state should be RegisterState.initial()', () {
//     expect(registerBloc.state, equals(RegisterState.initial()));
//   });

//   blocTest<RegisterBloc, RegisterState>(
//     'emits [loading, success] when registration succeeds',
//     build: () {
//       when(() => mockRegisterUserUseCase.call(any()))
//           .thenAnswer((_) async => Right(null));
//       return registerBloc;
//     },
//     act: (bloc) => bloc.add(
//       RegisterUser(
//         context: MockBuildContext(),
//         fullname: 'Test User',
//         email: 'test@example.com',
//         phone: '1234567890',
//         username: 'testuser',
//         password: 'password123',
//         address: 'Test Address',
//       ),
//     ),
//     expect: () => [
//       RegisterState(isLoading: true, isSuccess: false),
//       RegisterState(isLoading: false, isSuccess: true),
//     ],
//   );

//   blocTest<RegisterBloc, RegisterState>(
//     'emits [loading, failure] when registration fails',
//     build: () {
//       when(() => mockRegisterUserUseCase.call(any())).thenAnswer(
//           (_) async => Left(ApiFailure(message: 'Registration Failed')));
//       return registerBloc;
//     },
//     act: (bloc) => bloc.add(
//       RegisterUser(
//         context: MockBuildContext(),
//         fullname: 'Test User',
//         email: 'test@example.com',
//         phone: '1234567890',
//         username: 'testuser',
//         password: 'password123',
//         address: 'Test Address',
//       ),
//     ),
//     expect: () => [
//       RegisterState(isLoading: true, isSuccess: false),
//       RegisterState(isLoading: false, isSuccess: false),
//     ],
//   );

//   blocTest<RegisterBloc, RegisterState>(
//     'emits [loading, success with image] when image upload succeeds',
//     build: () {
//       when(() => mockUploadImageUseCase.call(any()))
//           .thenAnswer((_) async => Right('image.png'));
//       return registerBloc;
//     },
//     act: (bloc) => bloc.add(UploadImage(file: File('path/to/file'))),
//     expect: () => [
//       RegisterState(isLoading: true, isSuccess: false),
//       RegisterState(isLoading: false, isSuccess: true, imageName: 'image.png'),
//     ],
//   );

//   blocTest<RegisterBloc, RegisterState>(
//     'emits [loading, failure] when image upload fails',
//     build: () {
//       when(() => mockUploadImageUseCase.call(any()))
//           .thenAnswer((_) async => Left(ApiFailure(message: 'Upload Failed')));
//       return registerBloc;
//     },
//     act: (bloc) => bloc.add(UploadImage(file: File('path/to/file'))),
//     expect: () => [
//       RegisterState(isLoading: true, isSuccess: false),
//       RegisterState(isLoading: false, isSuccess: false),
//     ],
//   );
// }
