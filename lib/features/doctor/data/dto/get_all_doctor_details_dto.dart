import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_application_project/features/doctor/data/model/doctor_api_model.dart';
import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity.dart';

part 'get_all_doctor_details_dto.g.dart';

@JsonSerializable()
class GetDoctorDetailsByIdDTO {
  final DoctorApiModel doctor;
  final String message;

  GetDoctorDetailsByIdDTO({
    required this.doctor,
    required this.message,
  });

  /// ✅ Properly parses JSON to DTO
  // factory GetDoctorDetailsByIdDTO.fromJson(Map<String, dynamic> json) {
  //   return GetDoctorDetailsByIdDTO(
  //     doctor: DoctorApiModel.fromJson(json),
  //     message: '',
  //   );
  // }
  factory GetDoctorDetailsByIdDTO.fromJson(Map<String, dynamic> json) {
    return GetDoctorDetailsByIdDTO(
      doctor: DoctorApiModel.fromJson(
          json['doctor'] as Map<String, dynamic>), // ✅ Extract "doctor" object
      message: json['message'] ?? '', // ✅ Use message from response
    );
  }

  /// ✅ Converts DTO to Domain Entity
  DoctorEntity toDomain() {
    return DoctorEntity(
      doctorId: doctor.doctorId,
      email: doctor.email,
      image: doctor.image,
      contactNo: doctor.contactNo,
      username: doctor.username,
      password: doctor.password,
      fullname: doctor.fullname,
      dob: doctor.dob,
      gender: doctor.gender,
      address: doctor.address,
      specialization: doctor.specialization,
      qualification: doctor.qualification,
      experience: doctor.experience,
      fees: doctor.fees,
      availableSlots: doctor.availableSlots,
      role: doctor.role,
      description: doctor.description,
    );
  }
  // Map<String, dynamic> toJson() => _$GetAllBatchDTOToJson(this);
}
