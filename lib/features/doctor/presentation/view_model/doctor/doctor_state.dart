// part of 'doctor_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';

class DoctorState extends Equatable {
  final bool isLoading;
  final String? error;
  final List<DoctorEntity> doctors;
  final DoctorEntity? selectedDoctor; // Add this to hold a single doctor

  const DoctorState({
    required this.isLoading,
    required this.error,
    required this.doctors,
    this.selectedDoctor,
  });

  factory DoctorState.initial() {
    return const DoctorState(
      isLoading: false,
      error: null,
      doctors: [],
      selectedDoctor: null,
    );
  }

  DoctorState copyWith({
    bool? isLoading,
    String? error,
    List<DoctorEntity>? doctors,
    DoctorEntity? selectedDoctor,
  }) {
    return DoctorState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      doctors: doctors ?? this.doctors,
      selectedDoctor: selectedDoctor ?? this.selectedDoctor,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        doctors,
        selectedDoctor,
      ];
}
