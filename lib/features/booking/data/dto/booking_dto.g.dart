// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDTO _$BookingDTOFromJson(Map<String, dynamic> json) => BookingDTO(
      message: json['message'] as String,
      appointment:
          BookingApiModel.fromJson(json['appointment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingDTOToJson(BookingDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'appointment': instance.appointment,
    };
