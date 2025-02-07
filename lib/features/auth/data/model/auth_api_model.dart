import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_application_project/features/auth/domain/entity/auth_entity.dart';
part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: '_id') // Binding for server variable name with userId
  final String? userId;
  final String fullname;
  final String email;
  final String? image;
  final String phone;
  final String? gender;
  final DateTime? dob;
  final String address;
  final String username;
  final String password;

  const AuthApiModel({
    this.userId,
    required this.fullname,
    required this.email,
    this.image,
    required this.phone,
    this.gender,
    this.dob,
    required this.address,
    required this.username,
    required this.password,
  });

  const AuthApiModel.empty()
      : userId = '',
        fullname = '',
        email = '',
        image = '',
        phone = '',
        gender = '',
        dob = null,
        address = '',
        username = '',
        password = '';

  // factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
  //     _$AuthApiModelFromJson(json);

  // Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // From JSON
  factory AuthApiModel.fromJson(Map<String, dynamic> json) {
    return AuthApiModel(
      userId: json['_id'] as String?,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      image: json['image'] as String?,
      phone: json['phone'] as String,
      gender: json['gender'] as String?,
      dob: json['dob'] != null
          ? DateTime.parse(json['dob'] as String)
          : null, // Parsing DateTime if it's available
      address: json['address'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': userId,
      'fullname': fullname,
      'email': email,
      'image': image,
      'phone': phone,
      'gender': gender,
      'dob': dob?.toIso8601String(), // Format DateTime if it's available
      'address': address,
      'username': username,
      'password': password,
    };
  }
  // api object to entity

  AuthEntity toEntity() => AuthEntity(
        // userId: userId,
        username: username,
        phone: phone,
        fullname: fullname,
        address: address,
        email: email,
        password: password,
        userId: '',
      );

  // entity to api object
  AuthApiModel fromEntity(AuthEntity entity) => AuthApiModel(
      userId: entity.userId ?? '',
      fullname: fullname,
      email: email,
      phone: phone,
      address: address,
      username: username,
      password: password);

  // convert api list to entity list
  List<AuthEntity> toEntityList(List<AuthApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [
        userId,
        fullname,
        email,
        image,
        phone,
        gender,
        dob,
        address,
        username,
        password,
      ];
}
