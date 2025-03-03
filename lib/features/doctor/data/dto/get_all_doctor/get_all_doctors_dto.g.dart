// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_doctors_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllDoctorsDTO _$GetAllDoctorsDTOFromJson(Map<String, dynamic> json) =>
    GetAllDoctorsDTO(
      success: json['success'] as bool,
      count: (json['count'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => DoctorApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllDoctorsDTOToJson(GetAllDoctorsDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
