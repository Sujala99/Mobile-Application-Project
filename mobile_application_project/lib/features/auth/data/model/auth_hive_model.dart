import 'package:softwarica_student_management_bloc/app/constants/hive_table_constant.dart';
import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entity/auth_entity.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.authTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? userId;

  @HiveField(1)
  final String fullname;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final String city;

  @HiveField(5)
  final String username;

  @HiveField(6)
  final String password;

  // Constructor
  AuthHiveModel({
    String? userId,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.city,
    required this.username,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  const AuthHiveModel.initial()
      : userId = '',
        fullname = '',
        email = '',
        phone = '',
        city = '',
        username = '',
        password = '';

  // Convert from Entity
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      userId: entity.userId,
      fullname: entity.fullname,
      email: entity.email,
      phone: entity.phone,
      city: entity.city,
      username: entity.username,
      password: entity.password,
    );
  }

  // Convert to Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: userId,
      fullname: fullname,
      email: email,
      phone: phone,
      city: city,
      username: username,
      password: password,
    );
  }

  @override
  List<Object?> get props =>
      [userId, fullname, email, phone, city, username, password];
}
