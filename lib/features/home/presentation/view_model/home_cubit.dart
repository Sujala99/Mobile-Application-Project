import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application_project/app/di/di.dart';
import 'package:mobile_application_project/features/auth/presentation/view/login_view.dart';
import 'package:mobile_application_project/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:mobile_application_project/features/home/presentation/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void onTabTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void logout(BuildContext context) {
    // Wait for 2 seconds
    Future.delayed(const Duration(seconds: 2), () async {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value:
                  getIt<LoginBloc>(), // Ensure LoginBloc is properly injected
              child: LoginView(),
            ),
          ),
        );
      }
    });
  }

  // Store the user ID
  void setUserId(String userId) {
    emit(state.copyWith(userId: userId)); // Store user ID in HomeState
  }

  // Getter for the user ID
  String get userId => state.userId;
}
