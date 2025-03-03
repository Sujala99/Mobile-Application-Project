import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_application_project/app/shared_prefs/token_shared_prefs.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/doctor/domain/repository/doctor_repository.dart';

import '../../../../app/usecase/usecase.dart';

class DeleteDoctorParams extends Equatable {
  final String doctorId;

  const DeleteDoctorParams({required this.doctorId});

  const DeleteDoctorParams.empty() : doctorId = '_empty.string';

  @override
  List<Object?> get props => [
        doctorId,
      ];
}

class DeleteDoctorUsecase
    implements UsecaseWithParams<void, DeleteDoctorParams> {
  final IDoctorRepository doctorRepository;
  final TokenSharedPrefs tokenSharedPrefs;

  DeleteDoctorUsecase({
    required this.doctorRepository,
    required this.tokenSharedPrefs,
  });

  @override
  Future<Either<Failure, void>> call(DeleteDoctorParams params) async {
    // Get token from Shared Preferences and send it to the server
    final token = await tokenSharedPrefs.getToken();
    return token.fold((l) {
      return Left(l);
    }, (r) async {
      return await doctorRepository.deleteDoctor(params.doctorId, r);
    });
  }
}
