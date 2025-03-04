// import 'package:dartz/dartz.dart';
// import 'package:mobile_application_project/core/error/failure.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class TokenSharedPrefs {
//   final SharedPreferences _sharedPreferences;

//   TokenSharedPrefs(this._sharedPreferences);

//   Future<Either<Failure, void>> saveToken(String token) async {
//     try {
//       await _sharedPreferences.setString('token', token);
//       return const Right(null);
//     } catch (e) {
//       return Left(SharedPrefsFailure(message: e.toString()));
//     }
//   }

//   Future<Either<Failure, String>> getToken() async {
//     try {
//       final token = _sharedPreferences.getString('token');
//       return Right(token ?? '');
//     } catch (e) {
//       return Left(SharedPrefsFailure(message: e.toString()));
//     }
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:mobile_application_project/core/error/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenSharedPrefs {
  final SharedPreferences _sharedPreferences;

  TokenSharedPrefs(this._sharedPreferences);

  // Save token in shared preferences
  Future<Either<Failure, void>> saveToken(String token) async {
    try {
      await _sharedPreferences.setString('token', token);
      return const Right(null);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  // Get token from shared preferences
  Future<Either<Failure, String?>> getToken() async {
    try {
      final token = _sharedPreferences.getString('token');
      if (token != null) {
        return Right(token);
      } else {
        return Left(SharedPrefsFailure(message: 'Token not found'));
      }
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }
}
