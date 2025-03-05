// import 'package:dio/dio.dart';
// import 'package:mobile_application_project/app/constants/api_endpoints.dart';
// import 'package:mobile_application_project/features/booking/data/data_source/remote_data_source/booking_data_source.dart';
// import 'package:mobile_application_project/features/booking/data/model/booking_api_model.dart';
// import 'package:mobile_application_project/features/booking/domain/entity/bookings_entity.dart';

// class BookingRemoteDataSource implements IBookingDataSource {
//   final Dio _dio;

//   BookingRemoteDataSource(this._dio);

//   @override
//   Future<void> createBooking(BookingsEntity booking) async {
//     try {
//       // Convert entity to model
//       var bookingApiModel = BookingApiModel.fromEntity(booking);
//       var response = await _dio.post(
//         ApiEndpoints.bookappointment,
//         data: bookingApiModel.toJson(),
//       );
//       if (response.statusCode == 201) {
//         return;
//       } else {
//         throw Exception(response.statusMessage);
//       }
//     } on DioException catch (e) {
//       throw Exception(e.response?.data['message'] ?? e.message);
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }
// }


import 'package:dio/dio.dart';
import 'package:mobile_application_project/app/constants/api_endpoints.dart';
import 'package:mobile_application_project/app/shared_prefs/token_shared_prefs.dart';
import 'package:mobile_application_project/features/booking/data/data_source/remote_data_source/booking_data_source.dart';
import 'package:mobile_application_project/features/booking/data/model/booking_api_model.dart';
import 'package:mobile_application_project/features/booking/domain/entity/bookings_entity.dart';

class BookingRemoteDataSource implements IBookingDataSource {
  final Dio _dio;
  final TokenSharedPrefs _tokenSharedPrefs;

  BookingRemoteDataSource(this._dio, this._tokenSharedPrefs);

  @override
  Future<void> createBooking(BookingsEntity booking) async {
    try {
      // Retrieve token before making the request
      final tokenResult = await _tokenSharedPrefs.getToken();
      String? token;

      tokenResult.fold(
        (failure) => throw Exception("Failed to retrieve token: ${failure.message}"),
        (retrievedToken) => token = retrievedToken,
      );

      if (token == null || token!.isEmpty) {
        throw Exception("Token not found. Please log in again.");
      }

      // Set Authorization Header
      _dio.options.headers["Authorization"] = "Bearer $token";

      // Convert entity to model
      var bookingApiModel = BookingApiModel.fromEntity(booking);
      var response = await _dio.post(
        ApiEndpoints.bookappointment,
        data: bookingApiModel.toJson(),
      );

      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
