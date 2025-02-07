import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobile_application_project/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:mobile_application_project/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:mobile_application_project/features/auth/presentation/view_model/register/register_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/core/error/failure.dart';

// Mock Classes
class MockRegisterUserUseCase extends Mock implements RegisterUserUseCase {}

class MockUploadImageUsecase extends Mock implements UploadImageUsecase {}

void main() {
  late RegisterBloc registerBloc;
  late MockRegisterUserUseCase mockRegisterUserUseCase;
  late MockUploadImageUsecase mockUploadImageUsecase;

  setUp(() {
    mockRegisterUserUseCase = MockRegisterUserUseCase();
    mockUploadImageUsecase = MockUploadImageUsecase();
    registerBloc = RegisterBloc(
      registerUserUseCase: mockRegisterUserUseCase,
      uploadImageUsecase: mockUploadImageUsecase,
      verifyBloc: null, // Pass null if not required
    );

    registerFallbackValue(RegisterUserParams.empty());
    registerFallbackValue(UploadImageParams(file: File('')));
  });

  tearDown(() {
    registerBloc.close();
  });

  test('Initial state should be RegisterState.initial()', () {
    expect(registerBloc.state, RegisterState.initial());
  });

  // blocTest<RegisterBloc, RegisterState>(
  //   'emits [loading, success] when RegisterUser event is successful',
  //   build: () {
  //     when(() => mockRegisterUserUseCase.call(any()))
  //         .thenAnswer((_) async => const Right(null));

  //     return registerBloc;
  //   },
  //   act: (bloc) => bloc.add(RegisterUser(
  //     fullname: 'John Doe',
  //     email: 'john@example.com',
  //     phone: '1234567890',
  //     username: 'johndoe',
  //     password: 'password123',
  //     address: 'Some Address',
  //     dob: DateTime(2000, 1, 1),
  //     gender: 'Male',
  //     image: 'test_image.png',
  //     context: MockBuildContext(), // Mock context for snackbars
  //   )),
  //   expect: () => [
  //     RegisterState.initial().copyWith(isLoading: true),
  //     RegisterState.initial().copyWith(isLoading: false, isSuccess: true),
  //   ],
  //   verify: (_) {
  //     verify(() => mockRegisterUserUseCase.call(any())).called(1);
  //   },
  // );

  // blocTest<RegisterBloc, RegisterState>(
  //   'emits [loading, failure] when RegisterUser event fails',
  //   build: () {
  //     when(() => mockRegisterUserUseCase.call(any())).thenAnswer(
  //         (_) async => Left(ApiFailure(message: 'Registration failed')));

  //     return registerBloc;
  //   },
  //   act: (bloc) => bloc.add(RegisterUser(
  //     fullname: 'John Doe',
  //     email: 'john@example.com',
  //     phone: '1234567890',
  //     username: 'johndoe',
  //     password: 'password123',
  //     address: 'Some Address',
  //     dob: DateTime(2000, 1, 1),
  //     gender: 'Male',
  //     image: 'test_image.png',
  //     context: MockBuildContext(),
  //   )),
  //   expect: () => [
  //     RegisterState.initial().copyWith(isLoading: true),
  //     RegisterState.initial().copyWith(isLoading: false, isSuccess: false),
  //   ],
  //   verify: (_) {
  //     verify(() => mockRegisterUserUseCase.call(any())).called(1);
  //   },
  // );

  blocTest<RegisterBloc, RegisterState>(
    'emits [loading, success] when UploadImage event is successful',
    build: () {
      when(() => mockUploadImageUsecase.call(any()))
          .thenAnswer((_) async => const Right('uploaded_image.png'));

      return registerBloc;
    },
    act: (bloc) => bloc.add(UploadImage(file: File('test_image.png'))),
    expect: () => [
      RegisterState.initial().copyWith(isLoading: true),
      RegisterState.initial().copyWith(
          isLoading: false, isSuccess: true, imageName: 'uploaded_image.png'),
    ],
    verify: (_) {
      verify(() => mockUploadImageUsecase.call(any())).called(1);
    },
  );

  blocTest<RegisterBloc, RegisterState>(
    'emits [loading, failure] when UploadImage event fails',
    build: () {
      when(() => mockUploadImageUsecase.call(any()))
          .thenAnswer((_) async => Left(ApiFailure(message: 'Upload failed')));

      return registerBloc;
    },
    act: (bloc) => bloc.add(UploadImage(file: File('test_image.png'))),
    expect: () => [
      RegisterState.initial().copyWith(isLoading: true),
      RegisterState.initial().copyWith(isLoading: false, isSuccess: false),
    ],
    verify: (_) {
      verify(() => mockUploadImageUsecase.call(any())).called(1);
    },
  );
}

// Mock BuildContext for SnackBar (if needed)
class MockBuildContext extends Mock implements BuildContext {}
