import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';
import 'package:uuid/uuid.dart';

import '../../../../app/constants/hive_table_constant.dart';

part 'doctor_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.doctorTableId)
class DoctorHiveModel extends Equatable {
  @HiveField(0)
  final String? doctorId;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String password;

  @HiveField(4)
  final String? contactNo;

  @HiveField(5)
  final String? image;

  @HiveField(6)
  final String fullname;

  @HiveField(7)
  final DateTime? dob;

  @HiveField(8)
  final String? gender;

  @HiveField(9)
  final String? address;

  @HiveField(10)
  final String? specialization;

  @HiveField(11)
  final String? qualification;

  @HiveField(12)
  final int? experience;

  @HiveField(13)
  final String? fees;

  @HiveField(14)
  final String? availableSlots;

  @HiveField(15)
  final String? role;

  @HiveField(16)
  final String? description;

  DoctorHiveModel({
    String? doctorId,
    required this.username,
    required this.email,
    required this.password,
    this.contactNo,
    this.image,
    required this.fullname,
    this.dob,
    this.gender,
    this.address,
    this.specialization,
    this.qualification,
    this.experience,
    this.fees,
    this.availableSlots,
    this.role,
    this.description,
  }) : doctorId = doctorId ?? const Uuid().v4();

  /// **Initial Constructor**
  const DoctorHiveModel.initial()
      : doctorId = '',
        username = '',
        email = '',
        password = '',
        contactNo = '',
        image = null,
        fullname = '',
        dob = null,
        gender = null,
        address = null,
        specialization = null,
        qualification = null,
        experience = null,
        fees = null,
        availableSlots = null,
        role = null,
        description = null;

// FROM ENTITY
  factory DoctorHiveModel.fromEntity(DoctorEntity doctorEntity) {
    return DoctorHiveModel(
      doctorId: doctorEntity.doctorId,
      username: doctorEntity.username,
      email: doctorEntity.email,
      password: doctorEntity.password,
      contactNo: doctorEntity.contactNo,
      image: doctorEntity.image,
      fullname: doctorEntity.fullname,
      dob: doctorEntity.dob,
      gender: doctorEntity.gender,
      address: doctorEntity.address,
      specialization: doctorEntity.specialization,
      qualification: doctorEntity.qualification,
      experience: doctorEntity.experience,
      fees: doctorEntity.fees,
      availableSlots: doctorEntity.availableSlots,
      role: doctorEntity.role,
      description: doctorEntity.description,
    );
  }

  /// **Convert to Entity**
  DoctorEntity toEntity() {
    return DoctorEntity(
      doctorId: doctorId,
      username: username,
      email: email,
      password: password,
      contactNo: contactNo,
      image: image,
      fullname: fullname,
      dob: dob,
      gender: gender,
      address: address,
      specialization: specialization,
      qualification: qualification,
      experience: experience,
      fees: fees,
      availableSlots: availableSlots,
      role: role,
      description: description,
    );
  }

  static List<DoctorHiveModel> fromEntityList(List<DoctorEntity> entities) {
    return entities.map((e) => DoctorHiveModel.fromEntity(e)).toList();
  }

  static List<DoctorEntity> toEntityList(List<DoctorHiveModel> entities) {
    return entities.map((e) => e.toEntity()).toList();
  }

  @override
  List<Object?> get props => [
        doctorId,
        username,
        email,
        password,
        contactNo,
        image,
        fullname,
        dob,
        gender,
        address,
        specialization,
        qualification,
        experience,
        fees,
        availableSlots,
        role,
        description,
      ];
}
