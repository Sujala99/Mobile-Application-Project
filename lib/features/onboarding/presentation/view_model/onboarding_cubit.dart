// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';
// import 'package:mobile_application_project/features/auth/presentation/view/login_view.dart';
// import 'package:mobile_application_project/features/auth/presentation/view_model/login/login_bloc.dart';

// class OnboardingCubit extends Cubit<void> {
//   OnboardingCubit(this._loginBloc) : super(null);

//   final LoginBloc _loginBloc;

//   Future<void> completeOnboarding(BuildContext context) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('hasCompletedOnboarding', true);

//     if (context.mounted) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => BlocProvider.value(
//             value: _loginBloc,
//             child: LoginView(),
//           ),
//         ),
//       );
//     }
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application_project/app/di/di.dart';
import 'package:mobile_application_project/features/auth/presentation/view/login_view.dart';
import 'package:mobile_application_project/features/auth/presentation/view_model/login/login_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
      : super(
          OnboardingState(
            currentIndex: 0,
            isLastPage: false,
          ),
        );

  final PageController pageController = PageController();

  void onPageChanged(int index, int totalPages) {
    emit(
      OnboardingState(
        currentIndex: index,
        isLastPage: index == totalPages - 1,
      ),
    );
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void skipToLastPage(int totalPages) {
    pageController.jumpToPage(totalPages - 1);
  }

  void navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<LoginBloc>(), // Provide UserLoginBloc
          child: const LoginView(),
        ),
      ),
    );
  }
}
