import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_bloc.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';
import 'package:mobile_application_project/features/doctor/domain/use_case/get_all_doctor_usecase.dart';
import 'package:mobile_application_project/features/doctor/domain/use_case/get_doctor_details_usecase.dart';
import 'package:mobile_application_project/features/doctor/presentation/view_model/doctor/doctor_event.dart';
import 'package:mobile_application_project/features/doctor/presentation/view_model/doctor/doctor_state.dart';

// part 'doctor_event.dart';
// part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final GetAllDoctorUsecase _getAllDoctorUsecase;
  final GetDoctorDetailUseCase
      _getDoctorDetailUsecase; // Add use case for course details
  final BookingBloc _bookingBloc;

  DoctorBloc({
    required BookingBloc bookingBloc,
    required GetAllDoctorUsecase getAllDoctorUsecase,
    required GetDoctorDetailUseCase
        getDoctorDetailUsecase, // Inject the new use case
  })  : _bookingBloc = bookingBloc,
        _getAllDoctorUsecase = getAllDoctorUsecase,
        _getDoctorDetailUsecase = getDoctorDetailUsecase,
        super(DoctorState.initial()) {
    on<DoctorLoad>(_onDoctorLoad);
    on<DoctorDetailLoad>(_onDoctorDetailLoad);
    // Handle course details fetching
    on<NavigateBookingScreenEvent>((event, emit) {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _bookingBloc),
            ],
            child: event.destination,
          ),
        ),
      );
    });
    // Start fetching courses automatically
    add(DoctorLoad());
  }

  Future<void> _onDoctorLoad(
    DoctorLoad event,
    Emitter<DoctorState> emit,
  ) async {
    emit(state.copyWith(
        isLoading: true, error: null)); // Reset errors before loading

    final result = await _getAllDoctorUsecase();

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (doctors) => emit(state.copyWith(isLoading: false, doctors: doctors)),
    );
  }

  // Future<void> _onDoctorDetailLoad(
  //   DoctorDetailLoad event,
  //   Emitter<DoctorState> emit,
  // ) async {
  //   emit(state.copyWith(isLoading: true, error: null)); // Reset loading state

  //   final result = await _getDoctorDetailUsecase(event.doctorId);

  //   result.fold(
  //     (failure) =>
  //         emit(state.copyWith(isLoading: false, error: failure.message)),

  //     (doctor) =>
  //         emit(state.copyWith(isLoading: false, selectedDoctor: doctor)),
  //   );
  // }

  Future<void> _onDoctorDetailLoad(
    DoctorDetailLoad event,
    Emitter<DoctorState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _getDoctorDetailUsecase(event.doctorId);

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (doctor) {
        print("Fetched Doctor: $doctor"); // Log fetched doctor
        emit(state.copyWith(isLoading: false, selectedDoctor: doctor));
      },
    );
  }
}
