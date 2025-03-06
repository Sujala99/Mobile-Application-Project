

import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:mobile_application_project/features/booking/data/data_source/remote_data_source/booking_remote_data_source.dart';
import 'package:mobile_application_project/features/booking/domain/entity/bookings_entity.dart';
import 'package:mobile_application_project/features/booking/domain/repository/booking_repository.dart';

class BookingRemoteRepository implements IBookingRepository {
  final BookingRemoteDataSource _bookingRemoteDataSource;

  BookingRemoteRepository(this._bookingRemoteDataSource);

  @override
  Future<Either<Failure, void>> createBooking(BookingsEntity booking) async {
    try {
      await _bookingRemoteDataSource.createBooking(booking);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: "Failed to create booking: ${e.toString()}"));
    }
  }
}
