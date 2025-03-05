// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../core/common/snackbar/my_snackbar.dart';
// import '../../../../home/presentation/view/home_view.dart';
// import '../../../../home/presentation/view_model/home_cubit.dart';
// import '../../../domain/use_case/login_usecase.dart';
// import '../signup/register_bloc.dart';

// part 'login_event.dart';
// part 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final RegisterBloc _registerBloc;
//   final HomeCubit _homeCubit;
//   final LoginUseCase _loginUseCase;

//   LoginBloc({
//     required RegisterBloc registerBloc,
//     required HomeCubit homeCubit,
//     required LoginUseCase loginUseCase,
//   })  : _registerBloc = registerBloc,
//         _homeCubit = homeCubit,
//         _loginUseCase = loginUseCase,
//         super(LoginState.initial()) {
//     on<NavigateRegisterScreenEvent>((event, emit) {
//       Navigator.push(
//         event.context,
//         MaterialPageRoute(
//           builder: (context) => BlocProvider.value(
//             value: _registerBloc,
//             child: event.destination,
//           ),
//         ),
//       );
//     });

//     on<NavigateHomeScreenEvent>((event, emit) {
//       Navigator.pushReplacement(
//         event.context,
//         MaterialPageRoute(
//           builder: (context) => BlocProvider.value(
//             value: _homeCubit,
//             child: event.destination,
//           ),
//         ),
//       );
//     });

//     on<LoginUserEvent>((event, emit) async {
//       emit(state.copyWith(isLoading: true));
//       final result = await _loginUseCase(
//         LoginParams(
//           username: event.username,
//           password: event.password,
//         ),
//       );

//       result.fold(
//         (l) {
//           emit(state.copyWith(isLoading: false, isSuccess: false));
//           showMySnackBar(
//             context: event.context,
//             message: l.message ?? "Invalid Credentials",
//             color: Colors.red,
//           );
//         },
//         (token) {
//           emit(state.copyWith(isLoading: false, isSuccess: true));

//           // Show success snack bar
//           showMySnackBar(
//             context: event.context,
//             message: "Login Successful! Welcome!",
//             color: Colors.green,
//           );

//           // Store token or user info in HomeCubit
//           _homeCubit.setUserId(token); // Store user token in HomeCubit

//           add(
//             NavigateHomeScreenEvent(
//               context: event.context,
//               destination: const HomeView(),
//             ),
//           );
//         },
//       );
//     });
//   }
// }

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/snackbar/my_snackbar.dart';
import '../../../../home/presentation/view/home_view.dart';
import '../../../../home/presentation/view_model/home_cubit.dart';
import '../../../domain/use_case/login_usecase.dart';
import '../signup/register_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RegisterBloc _registerBloc;
  final HomeCubit _homeCubit;
  final LoginUseCase _loginUseCase;

  LoginBloc({
    required RegisterBloc registerBloc,
    required HomeCubit homeCubit,
    required LoginUseCase loginUseCase,
  })  : _registerBloc = registerBloc,
        _homeCubit = homeCubit,
        _loginUseCase = loginUseCase,
        super(LoginState.initial()) {
    on<NavigateRegisterScreenEvent>((event, emit) {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _registerBloc,
            child: event.destination,
          ),
        ),
      );
    });

    on<NavigateHomeScreenEvent>((event, emit) {
      Navigator.pushReplacement(
        event.context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _homeCubit,
            child: event.destination,
          ),
        ),
      );
    });

    on<LoginUserEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final result = await _loginUseCase(
        LoginParams(
          username: event.username,
          password: event.password,
        ),
      );

      result.fold(
        (l) {
          emit(state.copyWith(isLoading: false, isSuccess: false));
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showMySnackBar(
              context: event.context,
              message: l.message ?? "Invalid Credentials",
              color: Colors.red,
            );
          });
        },
        (token) {
          emit(state.copyWith(isLoading: false, isSuccess: true));
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showMySnackBar(
              context: event.context,
              message: "Login Successful! Welcome!",
              color: Colors.green,
            );
          });
          _homeCubit.setUserId(token); // Store user token in HomeCubit
          add(
            NavigateHomeScreenEvent(
              context: event.context,
              destination: const HomeView(),
            ),
          );
        },
      );
    });
  }
}