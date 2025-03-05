// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_doctor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllDoctorDTO _$GetAllDoctorDTOFromJson(Map<String, dynamic> json) =>
    GetAllDoctorDTO(
      doctors: (json['doctors'] as List<dynamic>)
          .map((e) => DoctorApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllDoctorDTOToJson(GetAllDoctorDTO instance) =>
    <String, dynamic>{
      'doctors': instance.doctors,
    };
