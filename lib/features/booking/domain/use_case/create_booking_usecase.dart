// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:mobile_application_project/app/usecase/usecase.dart';
// import 'package:mobile_application_project/core/error/failure.dart';
// import 'package:mobile_application_project/features/booking/domain/entity/bookings_entity.dart';
// import 'package:mobile_application_project/features/booking/domain/repository/booking_repository.dart';

// class CreateBookingParams extends Equatable {
//   final BookingsEntity booking;

//   const CreateBookingParams({required this.booking});

//   @override
//   List<Object?> get props => [booking];
// }

// class CreateBookingUsecase
//     implements UsecaseWithParams<void, CreateBookingParams> {
//   final IBookingRepository _bookingRepository;

//   CreateBookingUsecase({required IBookingRepository bookingRepository})
//       : _bookingRepository = bookingRepository;
//   @override
//   Future<Either<Failure, void>> call(CreateBookingParams params) async {
//     return await _bookingRepository.createBooking(params.booking);
//   }
// }


// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:mobile_application_project/app/usecase/usecase.dart';
// import 'package:mobile_application_project/core/error/failure.dart';
// import 'package:mobile_application_project/features/booking/domain/entity/bookings_entity.dart';
// import 'package:mobile_application_project/features/booking/domain/repository/booking_repository.dart';

// class CreateBookingParams extends Equatable {
//   final BookingsEntity booking;
//   final String token; // Add token here

//   const CreateBookingParams({
//     required this.booking,
//     required this.token,  // Make sure the token is required
//   });

//   @override
//   List<Object?> get props => [booking, token]; // Include token in comparison
// }

// class CreateBookingUsecase
//     implements UsecaseWithParams<void, CreateBookingParams> {
//   final IBookingRepository _bookingRepository;

//   CreateBookingUsecase({required IBookingRepository bookingRepository})
//       : _bookingRepository = bookingRepository;

//   @override
//   Future<Either<Failure, void>> call(CreateBookingParams params) async {
//     return await _bookingRepository.createBooking(params.booking, params.token);
//   }
// }





import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_application_project/app/usecase/usecase.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/booking/domain/entity/bookings_entity.dart';
import 'package:mobile_application_project/features/booking/domain/repository/booking_repository.dart';

class CreateBookingParams extends Equatable {
  final BookingsEntity booking;
  final String token; // Add token here

  const CreateBookingParams({
    required this.booking,
    required this.token,  // Make sure the token is required
  });

  @override
  List<Object?> get props => [booking, token]; // Include token in comparison
}

class CreateBookingUsecase implements UsecaseWithParams<void, CreateBookingParams> {
  final IBookingRepository _bookingRepository;

  CreateBookingUsecase({required IBookingRepository bookingRepository})
      : _bookingRepository = bookingRepository;

  @override
  Future<Either<Failure, void>> call(CreateBookingParams params) async {
    return await _bookingRepository.createBooking(params.booking);
  }
}
