// part of 'doctor_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class DoctorEvent extends Equatable {
  const DoctorEvent();

  @override
  List<Object> get props => [];
}

class NavigateBookingScreenEvent extends DoctorEvent {
  final BuildContext context;
  final Widget destination;

  const NavigateBookingScreenEvent({
    required this.context,
    required this.destination,
  });
}

class DoctorLoad extends DoctorEvent {} // Existing event

class DoctorDetailLoad extends DoctorEvent {
  // New event
  final String doctorId;

  const DoctorDetailLoad(this.doctorId);

  @override
  List<Object> get props => [doctorId];
}
