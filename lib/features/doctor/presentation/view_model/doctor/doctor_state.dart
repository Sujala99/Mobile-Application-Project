part of 'doctor_bloc.dart';

sealed class DoctorState extends Equatable {
  const DoctorState();
  
  @override
  List<Object> get props => [];
}

final class DoctorInitial extends DoctorState {}
