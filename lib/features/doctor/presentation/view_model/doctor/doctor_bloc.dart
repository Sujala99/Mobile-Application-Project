import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_scout_project/features/doctors/domain/entity/doctor_entity.dart';
import 'package:job_scout_project/features/doctors/domain/use_case/get_all_doctors_usecase.dart';
import 'package:job_scout_project/features/doctors/domain/use_case/get_doctor_by_id_usecase.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final GetAllDoctors _getAllDoctors;
  final GetDoctorById _getDoctorById;

  DoctorBloc({
    required GetAllDoctors getAllDoctors,
    required GetDoctorById getDoctorById,
  })  : _getAllDoctors = getAllDoctors,
        _getDoctorById = getDoctorById,
        super(DoctorState.initial()) {
    on<LoadDoctors>(_onLoadDoctors);
    on<LoadDoctorDetails>(_onLoadDoctorDetails);
  }

  void _onLoadDoctors(LoadDoctors event, Emitter<DoctorState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await _getAllDoctors.call();

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
      (doctors) => emit(state.copyWith(
        isLoading: false,
        error: null,
        doctors: doctors,
      )),
    );
  }

  void _onLoadDoctorDetails(LoadDoctorDetails event, Emitter<DoctorState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await _getDoctorById.call(event.doctorId);

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
      (doctor) => emit(state.copyWith(
        isLoading: false,
        error: null,
        selectedDoctor: doctor,
      )),
    );
  }
}
