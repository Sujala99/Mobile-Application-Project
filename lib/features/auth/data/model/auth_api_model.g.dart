// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      userId: json['_id'] as String?,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      image: json['image'] as String?,
      phone: json['phone'] as String,
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      address: json['address'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      '_id': instance.userId,
      'fullname': instance.fullname,
      'email': instance.email,
      'image': instance.image,
      'phone': instance.phone,
      'gender': instance.gender,
      'dob': instance.dob?.toIso8601String(),
      'address': instance.address,
      'username': instance.username,
      'password': instance.password,
    };
