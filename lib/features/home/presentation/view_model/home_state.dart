import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application_project/features/doctor/presentation/view/doctor_view.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;
  final String userId;

  const HomeState({
    required this.selectedIndex,
    required this.views,
    required this.userId,
  });

  static HomeState initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        const Center(child: Text('Dashboard')),
        const DoctorView(), // Use the actual Doctor View here
        const Center(child: Text('Appointment')),
        const Center(child: Text('Account')),
      ],
      userId: '',
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
    String? userId,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
      userId: userId ?? this.userId,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views, userId];
}
