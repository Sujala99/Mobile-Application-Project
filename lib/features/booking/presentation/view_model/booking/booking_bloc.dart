// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mobile_application_project/core/error/failure.dart';
// import 'package:mobile_application_project/features/booking/domain/use_case/create_booking_usecase.dart';
// import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_event.dart';
// import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_state.dart';

// class BookingBloc extends Bloc<BookingEvent, BookingState> {
//   final CreateBookingUsecase createBookingUsecase;

//   BookingBloc({
//     required this.createBookingUsecase,
//   }) : super(BookingInitial()) {
//     on<CreateBookingEvent>(_onCreateBooking);
//   }

//   // Handle creating a booking
//   Future<void> _onCreateBooking(
//     CreateBookingEvent event,
//     Emitter<BookingState> emit,
//   ) async {
//     emit(BookingLoading());

//     // final Either<Failure, void> result =
//     //     await createBookingUsecase(CreateBookingParams(booking: event.booking));
//     final result = await createBookingUsecase(
//       CreateBookingParams(booking: event.booking),
//     );
//     result.fold(
//       (failure) => emit(BookingError(failure.message)),
//       (_) => emit(BookingCreated()),
//     );
//   }

//   // Handle navigation to payment screen
//   // void _onNavigatePaymentScreen(
//   //   NavigatePaymentScreenEvent event,
//   //   Emitter<BookingState> emit,
//   // ) {
//   //   Navigator.push(
//   //     event.context,
//   //     MaterialPageRoute(
//   //       builder: (context) => MultiBlocProvider(
//   //         providers: [
//   //           BlocProvider.value(value: paymentBloc),
//   //         ],
//   //         child: event.destination,
//   //       ),
//   //     ),
//   //   );
//   // }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:mobile_application_project/core/error/failure.dart';
// import 'package:mobile_application_project/features/booking/domain/use_case/create_booking_usecase.dart';
// import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_event.dart';
// import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_state.dart';

// class BookingBloc extends Bloc<BookingEvent, BookingState> {
//   final CreateBookingUsecase createBookingUsecase;

//   BookingBloc({
//     required this.createBookingUsecase,
//   }) : super(BookingInitial()) {
//     on<CreateBookingEvent>(_onCreateBooking);
//   }

//   // Handle creating a booking
//   Future<void> _onCreateBooking(
//     CreateBookingEvent event,
//     Emitter<BookingState> emit,
//   ) async {
//     emit(BookingLoading());

//     // Assuming you have a method to get the token (e.g., from secure storage or a global state)
//     final token = await _getToken();

//     if (token.isEmpty) {
//       emit(BookingError("Token is missing, please log in again."));
//       return;
//     }

//     // Use the token to create the booking
//     final result = await createBookingUsecase(
//       CreateBookingParams(booking: event.booking, token: token),
//     );

//     result.fold(
//       (failure) => emit(BookingError(failure.message)),
//       (_) => emit(BookingCreated()),
//     );
//   }

//   // Replace this with your method for retrieving the token
//   Future<String> _getToken() async {
//     // Fetch the token from storage or any other appropriate method
//     // For example, use SharedPreferences or secure storage to get the token
//     return "your_token_here";  // Replace with actual token retrieval logic
//   }
// }





import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/app/shared_prefs/token_shared_prefs.dart';
import 'package:mobile_application_project/core/common/snackbar/my_snackbar.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/booking/domain/use_case/create_booking_usecase.dart';
import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_event.dart';
import 'package:mobile_application_project/features/booking/presentation/view_model/booking/booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final CreateBookingUsecase createBookingUsecase;
  final TokenSharedPrefs tokenSharedPrefs;

  BookingBloc({
    required this.createBookingUsecase,
    required this.tokenSharedPrefs,
  }) : super(BookingInitial()) {
    on<CreateBookingEvent>(_onCreateBooking);
  }

  Future<void> _onCreateBooking(
    CreateBookingEvent event,
    Emitter<BookingState> emit,
  ) async {
    emit(BookingLoading());

    // Retrieve the token
    final tokenResult = await tokenSharedPrefs.getToken();

    String? token;
    tokenResult.fold(
      (failure) {
        emit(BookingError("Authentication error: ${failure.message}"));
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showMySnackBar(
            context: event.context,
            message: failure.message ?? "Authentication error",
            color: Colors.red,
          );
        });
        return;
      },
      (retrievedToken) => token = retrievedToken,
    );

    if (token == null || token!.isEmpty) {
      emit(BookingError("User not authenticated. Please log in again."));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showMySnackBar(
          context: event.context,
          message: "User not authenticated. Please log in again.",
          color: Colors.red,
        );
      });
      return;
    }

    final result = await createBookingUsecase(
      CreateBookingParams(booking: event.booking, token: token!),
    );

    result.fold(
      (failure) {
        emit(BookingError("Failed to book appointment: ${failure.message}"));
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showMySnackBar(
            context: event.context,
            message: failure.message ?? "Failed to book appointment",
            color: Colors.red,
          );
        });
      },
      (_) {
        emit(BookingCreated());
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showMySnackBar(
            context: event.context,
            message: "Booking successful!",
            color: Colors.green,
          );
        });
      },
    );
  }
}