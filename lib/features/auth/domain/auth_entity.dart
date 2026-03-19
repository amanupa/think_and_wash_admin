import 'dart:convert';

class AuthEntity {
  final String otp;
  final String phone;
  final String role;

  AuthEntity({required this.otp, required this.phone, required this.role});
  String authModelToJson(AuthEntity entity) => json.encode(entity.toJson());
  Map<String, dynamic> toJson() => {"otp": otp, "phone": phone, "role": role};
}
