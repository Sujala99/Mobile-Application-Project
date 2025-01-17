import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPreferences sharedPreferences;

  SharedPref({required this.sharedPreferences});

  Future<void> saveData(String value) async {
    await sharedPreferences.setString("result", value);
  }

  Future<String?> getData() async {
    return sharedPreferences.getString("result");
  }
}
