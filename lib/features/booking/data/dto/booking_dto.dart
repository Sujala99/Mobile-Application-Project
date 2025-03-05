import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_application_project/features/booking/data/model/booking_api_model.dart';

part 'booking_dto.g.dart';

@JsonSerializable()
class BookingDTO {
  final String message;
  final BookingApiModel appointment;

  BookingDTO({
    required this.message,
    required this.appointment,
  });

  Map<String, dynamic> toJson() => _$BookingDTOToJson(this);

  factory BookingDTO.fromJson(Map<String, dynamic> json) =>
      _$BookingDTOFromJson(json);
}
