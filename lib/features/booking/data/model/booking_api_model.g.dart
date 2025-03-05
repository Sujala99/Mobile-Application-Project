// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingApiModel _$BookingApiModelFromJson(Map<String, dynamic> json) =>
    BookingApiModel(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      doctorId: json['doctorId'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$BookingApiModelToJson(BookingApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'doctorId': instance.doctorId,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };
