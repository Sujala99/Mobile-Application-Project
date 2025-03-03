import 'package:mobile_application_project/features/doctor/data/data_source/doctor_data_source.dart';
import 'package:mobile_application_project/features/doctor/data/model/doctor_hive_model.dart';
import '../../../../../core/network/local_network.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile_application_project/app/constants/hive_table_constant.dart';

import '../../../domain/entity/doctor_entity';

class DoctorLocalDataSource implements IDoctorDataSource {
  final HiveService hiveService;

  DoctorLocalDataSource({required this.hiveService});

  /// **Add a new doctor**
  @override
  Future<void> addDoctor(DoctorEntity doctor) async {
    try {
      var box =
          await Hive.openBox<DoctorHiveModel>(HiveTableConstant.doctorBox);
      final doctorModel = DoctorHiveModel.fromEntity(doctor);
      await box.put(doctorModel.doctorId, doctorModel);
    } catch (e) {
      throw Exception("Failed to add doctor: $e");
    }
  }

  /// **Delete a doctor by ID**
  @override
  Future<void> deleteDoctor(String id, String? token) async {
    try {
      var box =
          await Hive.openBox<DoctorHiveModel>(HiveTableConstant.doctorBox);
      if (box.containsKey(id)) {
        await box.delete(id);
      } else {
        throw Exception("Doctor not found");
      }
    } catch (e) {
      throw Exception("Failed to delete doctor: $e");
    }
  }

  /// **Retrieve all doctors**
  @override
  Future<List<DoctorHiveModel>> getAllDoctors() async {
    try {
      var box =
          await Hive.openBox<DoctorHiveModel>(HiveTableConstant.doctorBox);
      return box.values.toList();
    } catch (e) {
      throw Exception("Failed to fetch doctors: $e");
    }
  }

  /// **Retrieve a doctor by ID**
  @override
  Future<DoctorHiveModel> getDoctorById(String doctorId) async {
    try {
      var box =
          await Hive.openBox<DoctorHiveModel>(HiveTableConstant.doctorBox);
      if (box.containsKey(doctorId)) {
        return box.get(doctorId)!;
      } else {
        throw Exception("Doctor not found");
      }
    } catch (e) {
      throw Exception("Failed to fetch doctor: $e");
    }
  }

  /// **Update a doctor's details**
  @override
  Future<void> updateDoctor(DoctorHiveModel doctor) async {
    try {
      var box =
          await Hive.openBox<DoctorHiveModel>(HiveTableConstant.doctorBox);
      if (box.containsKey(doctor.doctorId)) {
        await box.put(doctor.doctorId, doctor);
      } else {
        throw Exception("Doctor not found");
      }
    } catch (e) {
      throw Exception("Failed to update doctor: $e");
    }
  }
}
