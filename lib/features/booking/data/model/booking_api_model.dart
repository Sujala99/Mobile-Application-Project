import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_application_project/features/booking/domain/entity/bookings_entity.dart';

part 'booking_api_model.g.dart';

@JsonSerializable()
class BookingApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String userId;
  final String doctorId;
  final String date; // In API, dates often come as String (ISO 8601)
  final String time;
  final String status;
  final String createdAt;

  const BookingApiModel({
    required this.id,
    required this.userId,
    required this.doctorId,
    required this.date,
    required this.time,
    required this.status,
    required this.createdAt,
  });

  /// ✅ Convert JSON to `BookingApiModel`
  factory BookingApiModel.fromJson(Map<String, dynamic> json) =>
      _$BookingApiModelFromJson(json);

  /// ✅ Convert `BookingApiModel` to JSON
  Map<String, dynamic> toJson() => _$BookingApiModelToJson(this);

  /// ✅ Convert `BookingApiModel` to Entity (Domain Layer)
  BookingsEntity toEntity() {
    return BookingsEntity(
      id: id,
      userId: userId,
      doctorId: doctorId,
      date: DateTime.parse(date), // Convert String to DateTime
      time: time,
      status: status,
      createdAt: DateTime.parse(createdAt), // Convert String to DateTime
    );
  }

  /// ✅ Convert `BookingsEntity` back to `BookingApiModel` (if needed)
  factory BookingApiModel.fromEntity(BookingsEntity entity) {
    return BookingApiModel(
      id: entity.id,
      userId: entity.userId,
      doctorId: entity.doctorId,
      date: entity.date.toIso8601String(),
      time: entity.time,
      status: entity.status,
      createdAt: entity.createdAt.toIso8601String(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        doctorId,
        date,
        time,
        status,
        createdAt,
      ];
}
