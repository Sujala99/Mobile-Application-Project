// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_doctor_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorDetailsByIdDTO _$GetDoctorDetailsByIdDTOFromJson(
        Map<String, dynamic> json) =>
    GetDoctorDetailsByIdDTO(
      doctor: DoctorApiModel.fromJson(json['doctor'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$GetDoctorDetailsByIdDTOToJson(
        GetDoctorDetailsByIdDTO instance) =>
    <String, dynamic>{
      'doctor': instance.doctor,
      'message': instance.message,
    };
