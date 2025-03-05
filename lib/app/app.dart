import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application_project/app/app_routes.dart';
import 'package:mobile_application_project/app/di/di.dart';
import 'package:mobile_application_project/core/theme/app_theme.dart';
import 'package:mobile_application_project/features/auth/presentation/view/login_view.dart';
import 'package:mobile_application_project/features/home/presentation/view/home_view.dart';
import 'package:mobile_application_project/features/splash/presentation/view/splash_view.dart';
import 'package:mobile_application_project/features/splash/presentation/view_model/splash_cubit.dart';

import '../features/auth/presentation/view/sign_up_view.dart';
import 'package:mobile_application_project/features/home/presentation/view_model/home_cubit.dart';
import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_bloc.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
        ),
       BlocProvider(
          create: (context) => getIt<BookingBloc>(), // ✅ Correct injection
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Management',
        theme: AppTheme.getApplicationTheme(isDarkMode: false),
        home: BlocProvider.value(
          value: getIt<SplashCubit>(),
          child: const SplashView(),
        ),
        routes: {
          AppRoutes.login: (context) => const LoginView(),
          AppRoutes.register: (context) => const SignUpView(),
          AppRoutes.home: (context) => const HomeView(),
        },
      ),
    );
  }
}