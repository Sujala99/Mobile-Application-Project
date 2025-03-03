import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_application_project/features/auth/domain/entity/auth_entity';
import 'package:uuid/uuid.dart';

import '../../../../app/constants/hive_table_constant.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.authTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? authId;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String password;

  @HiveField(4)
  final String contactNo;

  @HiveField(5)
  final String? image;

  @HiveField(6)
  final String fullname;

  @HiveField(7)
  final DateTime? dob;

  @HiveField(8)
  final String? gender;

  @HiveField(9)
  final String? address;

  AuthHiveModel({
    String? authId,
    required this.username,
    required this.email,
    required this.password,
    required this.contactNo,
    this.image,
    required this.fullname,
    this.dob,
    this.gender,
    this.address,
  }) : authId = authId ?? const Uuid().v4();

// Initial Constructor
  const AuthHiveModel.initial()
      : authId = '',
        username = '',
        email = '',
        password = '',
        contactNo = '',
        image = null,
        fullname = '',
        dob = null,
        gender = null,
        address = null;

// From Entity
  factory AuthHiveModel.fromEntity(AuthEntity authEntity) {
    return AuthHiveModel(
      authId: authEntity.authId,
      username: authEntity.username,
      email: authEntity.email,
      password: authEntity.password,
      contactNo: authEntity.contactNo,
      image: authEntity.image,
      fullname: authEntity.fullname,
      dob: authEntity.dob,
      gender: authEntity.gender,
      address: authEntity.address,
    );
  }

// To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      authId: authId,
      email: email,
      contactNo: contactNo,
      image: image,
      username: username,
      password: password,
      fullname: fullname,
      dob: dob,
      gender: gender,
      address: address,
    );
  }

// From Entity List
  static List<AuthHiveModel> fromEntityList(List<AuthEntity> entityList) {
    return entityList
        .map((authEntity) => AuthHiveModel.fromEntity(authEntity))
        .toList();
  }

  @override
  List<Object?> get props => [
        authId,
        username,
        email,
        password,
        contactNo,
        image,
        fullname,
        dob,
        gender,
        address,
      ];
}
