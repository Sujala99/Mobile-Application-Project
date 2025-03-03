import 'package:mobile_application_project/features/doctor/domain/entity/doctor_entity';
import '../model/appointment_hive_model.dart';

abstract interface class IDoctorDataSource {
  Future<List<DoctorHiveModel>> getAllDoctors();

  Future<void> addDoctor(DoctorEntity doctor);

  Future<void> deleteDoctor(String id, String? token);

  Future<DoctorHiveModel> getDoctorById(String doctorId);

  Future<void> updateDoctor(DoctorHiveModel doctor);
}
