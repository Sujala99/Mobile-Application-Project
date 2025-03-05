import 'dart:io';
import 'package:mobile_application_project/features/booking/domain/entity/bookings_entity.dart';

abstract interface class IBookingDataSource {
  // Future<void> createBooking(BookingsEntity booking, String token);
  Future<void> createBooking(BookingsEntity booking);

  // Future<String> sendAndVerifyOTP(String email, String otp);
}
