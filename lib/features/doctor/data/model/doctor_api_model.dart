import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';

part 'doctor_api_model.g.dart';

@JsonSerializable()
class DoctorApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? doctorId;
  final String email;
  final String? image;
  @JsonKey(name: 'phonenumber')
  final String? contactNo;
  final String username;
  final String password;
  final String fullname;
  final DateTime? dob;
  final String? gender;
  final String? address;
  final String? specialization;
  final String? qualification;
  final int? experience;
  final String? fees;
  final String? availableSlots;
  final String? role;
  final String? description;

  DoctorApiModel({
    this.doctorId,
    required this.email,
    this.image,
    this.contactNo,
    required this.username,
    required this.password,
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
  });

  // factory DoctorApiModel.fromJson(Map<String, dynamic> json) =>
  //     _$DoctorApiModelFromJson(json);

  // Map<String, dynamic> toJson() => _$DoctorApiModelToJson(this);

  factory DoctorApiModel.fromJson(Map<String, dynamic> json) {
    print("API Response: $json"); // Log raw response

    return DoctorApiModel(
      doctorId: json['_id'] as String?,
      email: json['email'] ?? '',
      image: json['image'] as String?, // Allow null
      contactNo: json['phonenumber'] as String?, // Allow null
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      fullname: json['fullname'] ?? '',
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      specialization: json['specialization'] as String?,
      qualification: json['qualification'] as String?,
      experience: json['experience'] as int?,
      fees: json['fees'] as String?,
      availableSlots: json['availableSlots'] as String?,
      role: json['role'] as String?,
      description: json['description'] as String?,
    );
  }

  // To entity

// From Entity
  factory DoctorApiModel.fromEntity(DoctorEntity doctorEntity) {
    return DoctorApiModel(
      username: doctorEntity.username,
      password: doctorEntity.password,
      email: doctorEntity.email,
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

  // To Entity
  DoctorEntity toEntity() {
    return DoctorEntity(
      doctorId: doctorId, // ✅ Add this line
      email: email,
      contactNo: contactNo,
      username: username,
      password: password,
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

  // To Entity List
  static List<DoctorEntity> toEntityList(List<DoctorApiModel> entityList) {
    return entityList.map((data) => data.toEntity()).toList();
  }

  // From entity list
  static List<DoctorApiModel> fromEntityList(List<DoctorEntity> entityList) {
    return entityList
        .map((entity) => DoctorApiModel.fromEntity(entity))
        .toList();
  }

  @override
  List<Object?> get props => [
        doctorId,
        email,
        image,
        contactNo,
        username,
        password,
        fullname,
        gender,
        dob,
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
