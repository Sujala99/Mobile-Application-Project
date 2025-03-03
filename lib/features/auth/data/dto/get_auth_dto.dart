import 'package:json_annotation/json_annotation.dart';

part 'get_auth_dto.g.dart';

@JsonSerializable()
class LoginDTO {
  final String message;
  final String token;
  final UserDTO user;

  LoginDTO({
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDTOToJson(this);
}

@JsonSerializable()
class UserDTO {
  final String id;
  final String username;
  final String email;
  final String role;

  UserDTO({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
