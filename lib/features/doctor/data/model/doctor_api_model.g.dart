// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorApiModel _$DoctorApiModelFromJson(Map<String, dynamic> json) =>
    DoctorApiModel(
      doctorId: json['_id'] as String?,
      email: json['email'] as String,
      image: json['image'] as String?,
      contactNo: json['phonenumber'] as String?,
      username: json['username'] as String,
      password: json['password'] as String,
      fullname: json['fullname'] as String,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      specialization: json['specialization'] as String?,
      qualification: json['qualification'] as String?,
      experience: (json['experience'] as num?)?.toInt(),
      fees: json['fees'] as String?,
      availableSlots: json['availableSlots'] as String?,
      role: json['role'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$DoctorApiModelToJson(DoctorApiModel instance) =>
    <String, dynamic>{
      '_id': instance.doctorId,
      'email': instance.email,
      'image': instance.image,
      'phonenumber': instance.contactNo,
      'username': instance.username,
      'password': instance.password,
      'fullname': instance.fullname,
      'dob': instance.dob?.toIso8601String(),
      'gender': instance.gender,
      'address': instance.address,
      'specialization': instance.specialization,
      'qualification': instance.qualification,
      'experience': instance.experience,
      'fees': instance.fees,
      'availableSlots': instance.availableSlots,
      'role': instance.role,
      'description': instance.description,
    };
