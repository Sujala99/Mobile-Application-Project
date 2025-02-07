import 'package:hive_flutter/adapters.dart';
import 'package:mobile_application_project/app/constants/hive_table_constant.dart';
import 'package:mobile_application_project/features/auth/data/model/auth_hive_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  /// Initializes Hive Database
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}doctor_appointment.db';
    Hive.init(path);

    // Register Adapters
    Hive.registerAdapter(AuthHiveModelAdapter());

    // Open the main user box
    // await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
  }

  /// Registers a new user
  Future<void> register(AuthHiveModel auth) async {
    try {
      var box = Hive.box<AuthHiveModel>(HiveTableConstant.userBox);
      await box.put(auth.userId, auth);
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
  Future<AuthHiveModel?> login(String identifier, String password) async {
    try {
      var box = Hive.box<AuthHiveModel>(HiveTableConstant.userBox);
      return box.values.firstWhere(
        (user) =>
            (user.username == identifier || user.email == identifier) &&
            user.password == password,
        orElse: () => throw Exception("User not found"),
      );
    } catch (e) {
      return null;
    }
  }

  /// Clears all data from the Hive database
  Future<void> clearAll() async {
    try {
      await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
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

  /// Closes Hive
  Future<void> close() async {
    await Hive.close();
  }
}
