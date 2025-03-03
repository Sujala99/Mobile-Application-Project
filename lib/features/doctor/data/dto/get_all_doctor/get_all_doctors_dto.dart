import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_application_project/features/doctor/data/model/doctor_api_model.dart';

part 'get_all_doctors_dto.g.dart';

@JsonSerializable()
class GetAllDoctorsDTO {
  final bool success;
  final int count;
  final List<DoctorApiModel> data;

  GetAllDoctorsDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  // Convert the DTO to JSON
  Map<String, dynamic> toJson() => _$GetAllDoctorsDTOToJson(this);

  // Convert the JSON response to DTO
  factory GetAllDoctorsDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllDoctorsDTOFromJson(json);
}
