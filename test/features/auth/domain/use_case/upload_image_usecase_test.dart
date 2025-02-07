import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_application_project/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'dart:io';

import '../../repository.mock.dart';

void main() {
  late AuthRepoMock repository;
  late UploadImageUsecase usecase;

  setUp(() {
    repository = AuthRepoMock();
    usecase = UploadImageUsecase(repository);

    // Registering a fallback value for File
    registerFallbackValue(File('test.png'));
  });

  final params =
      UploadImageParams(file: File('test.png')); // Provide a valid file

  test('should call the [AuthRepo.uploadProfilePicture]', () async {
    when(() => repository.uploadProfilePicture(any()))
        .thenAnswer((_) async => Right('image_url'));

    final result = await usecase(params);

    expect(result, Right('image_url'));

    verify(() => repository.uploadProfilePicture(any())).called(1);
    verifyNoMoreInteractions(repository);
  });
}
