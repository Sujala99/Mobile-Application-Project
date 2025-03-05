import 'package:hive_flutter/adapters.dart';
import 'package:mobile_application_project/app/constants/hive_table_constant.dart';
import 'package:mobile_application_project/features/auth/data/model/auth_hive_model.dart';
import 'package:mobile_application_project/features/doctor/data/model/doctor_hive_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  /// Initializes Hive Database
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}doctor_appointment.db';
    Hive.init(path);

    // Register Adapters
    Hive.registerAdapter(AuthHiveModelAdapter());
    Hive.registerAdapter(DoctorHiveModelAdapter());

    // Open the main boxes
    await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await Hive.openBox<DoctorHiveModel>(HiveTableConstant.doctorBox);
  }

  // ----------------------------------------
  // * USER FUNCTIONS
  // ----------------------------------------

  /// Registers a new user
  Future<void> register(AuthHiveModel auth) async {
    try {
      var box = Hive.box<AuthHiveModel>(HiveTableConstant.userBox);
      await box.put(auth.authId, auth);
    } catch (e) {
      throw Exception("Failed to register user: $e");
    }
  }

  /// Deletes a user by userId
  Future<void> deleteAuth(String id) async {
    try {
      var box = Hive.box<AuthHiveModel>(HiveTableConstant.userBox);
      await box.delete(id);
    } catch (e) {
      throw Exception("Failed to delete user: $e");
    }
  }

  /// Retrieves all registered users
  Future<List<AuthHiveModel>> getAllAuth() async {
    try {
      var box = Hive.box<AuthHiveModel>(HiveTableConstant.userBox);
      return box.values.toList();
    } catch (e) {
      throw Exception("Failed to fetch users: $e");
    }
  }

  /// Logs in a user using username or email and password
  Future<AuthHiveModel?> login(String username, String password) async {
    try {
      var box = Hive.box<AuthHiveModel>(HiveTableConstant.userBox);
      return box.values.firstWhere(
        (element) =>
            (element.username == username && element.password == password),
        orElse: () => throw Exception("User not found"),
      );
    } catch (e) {
      return null;
    }
  }

  // ----------------------------------------
  // * DOCTOR FUNCTIONS
  // ----------------------------------------

  /// Adds a new doctor
  // Future<void> addDoctor(DoctorHiveModel doctor) async {
  //   try {
  //     var box = Hive.box<DoctorHiveModel>(HiveTableConstant.doctorBox);
  //     await box.put(doctor.doctorId, doctor);
  //   } catch (e) {
  //     throw Exception("Failed to add doctor: $e");
  //   }
  // }

  /// Retrieves all doctors
  Future<List<DoctorHiveModel>> getDoctor() async {
    try {
      var box = Hive.box<DoctorHiveModel>(HiveTableConstant.doctorBox);
      return box.values.toList();
    } catch (e) {
      throw Exception("Failed to fetch doctors: $e");
    }
  }

  /// Retrieves a doctor by ID
  Future<DoctorHiveModel?> getDoctorDetail(String doctorId) async {
    try {
      var box = Hive.box<DoctorHiveModel>(HiveTableConstant.doctorBox);
      return box.get(doctorId);
    } catch (e) {
      return null;
    }
  }

  // /// Updates doctor details
  // Future<void> updateDoctor(DoctorHiveModel doctor) async {
  //   try {
  //     var box = Hive.box<DoctorHiveModel>(HiveTableConstant.doctorBox);
  //     if (box.containsKey(doctor.doctorId)) {
  //       await box.put(doctor.doctorId, doctor);
  //     } else {
  //       throw Exception("Doctor not found");
  //     }
  //   } catch (e) {
  //     throw Exception("Failed to update doctor: $e");
  //   }
  // }

  // /// Deletes a doctor by ID
  // Future<void> deleteDoctor(String doctorId) async {
  //   try {
  //     var box = Hive.box<DoctorHiveModel>(HiveTableConstant.doctorBox);
  //     await box.delete(doctorId);
  //   } catch (e) {
  //     throw Exception("Failed to delete doctor: $e");
  //   }
  // }

  // ----------------------------------------
  // * DATABASE MANAGEMENT FUNCTIONS
  // ----------------------------------------

  /// Clears all data from the Hive database
  Future<void> clearAll() async {
    try {
      await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
      await Hive.deleteBoxFromDisk(HiveTableConstant.doctorBox);
    } catch (e) {
      throw Exception("Failed to clear database: $e");
    }
  }

  /// Clears only the user box
  Future<void> clearUserBox() async {
    try {
      await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
    } catch (e) {
      throw Exception("Failed to clear user box: $e");
    }
  }

  /// Clears only the doctor box
  Future<void> clearDoctorBox() async {
    try {
      await Hive.deleteBoxFromDisk(HiveTableConstant.doctorBox);
    } catch (e) {
      throw Exception("Failed to clear doctor box: $e");
    }
  }

  /// Closes Hive
  Future<void> close() async {
    await Hive.close();
  }
}
