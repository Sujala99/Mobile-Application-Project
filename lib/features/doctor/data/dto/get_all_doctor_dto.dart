import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_application_project/features/doctor/data/model/doctor_api_model.dart';

part 'get_all_doctor_dto.g.dart';

@JsonSerializable()
class GetAllDoctorDTO {
  final List<DoctorApiModel> doctors;

  GetAllDoctorDTO({
    required this.doctors,
  });

  // factory GetAllDoctorDTO.fromJson(Map<String, dynamic> json) {
  //   // ✅ Extract "doctors" list from response
  //   final doctorsList = json['doctors'] as List<dynamic>? ?? [];

  //   return GetAllDoctorDTO(
  //     data: doctorsList
  //         .map((e) => DoctorApiModel.fromJson(e as Map<String, dynamic>))
  //         .toList(),
  //   );
  // }

  // Map<String, dynamic> toJson() => {"doctors": data.map((e) => e.toJson()).toList(),
  //     };

  Map<String, dynamic> toJson() => _$GetAllDoctorDTOToJson(this);

  factory GetAllDoctorDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllDoctorDTOFromJson(json);
}
