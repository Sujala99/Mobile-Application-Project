import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:softwarica_student_management_bloc/core/common/snackbar/my_snackbar.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/use_case/register_user_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc({
    required RegisterUseCase registerUseCase,
  })  : _registerUseCase = registerUseCase,
        super(RegisterState.initial()) {
    on<LoadCoursesAndBatches>(_onLoadCoursesAndBatches);
    on<RegisterStudent>(_onRegisterEvent);

    add(LoadCoursesAndBatches());
  }

  void _onLoadCoursesAndBatches(
    LoadCoursesAndBatches event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(isLoading: true));

    emit(state.copyWith(isLoading: false, isSuccess: true));
  }

  void _onRegisterEvent(
    RegisterStudent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await _registerUseCase.call(RegisterUserParams(
      fullname: event.fullname,
      email: event.email,
      phone: event.phone,
      city: event.city,
      username: event.username,
      password: event.password,
    ));

    result.fold(
      (l) => emit(state.copyWith(isLoading: false, isSuccess: false)),
      (r) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showMySnackBar(
            context: event.context, message: "Registration Successful");
      },
    );
  }
}
