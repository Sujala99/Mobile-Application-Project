import 'package:mobile_application_project/app/constants/hive_table_constant.dart';
import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entity/auth_entity.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.authTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String fullname;

  @HiveField(4)
  final DateTime? dob;

  @HiveField(5)
  final String? gender;

  @HiveField(6)
  final String address;

  @HiveField(7)
  final String? image;

  @HiveField(8)
  final String email;

  @HiveField(9)
  final String password;

  // Constructor
  AuthHiveModel({
    String? userId,
    required this.username,
    required this.phone,
    required this.fullname,
    this.dob,
    this.gender,
    required this.address,
    this.image,
    required this.email,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  // Initial Constructor

  const AuthHiveModel.initial()
      : userId = '',
        username = '',
        phone = '',
        fullname = '',
        dob = null,
        gender = null,
        address = '',
        image = null,
        email = '',
        password = '';

  // Convert from Entity
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      userId: entity.userId,
      username: entity.username,
      phone: entity.phone,
      fullname: entity.fullname,
      dob: entity.dob,
      gender: entity.gender,
      address: entity.address,
      image: entity.image,
      email: entity.email,
      password: entity.password,
    );
  }

  // Convert to Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: userId,
      username: username,
      phone: phone,
      fullname: fullname,
      dob: dob,
      gender: gender,
      address: address,
      image: image,
      email: email,
      password: password,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        username,
        phone,
        fullname,
        dob,
        gender,
        address,
        image,
        email,
        password
      ];
}
