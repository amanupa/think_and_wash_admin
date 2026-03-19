import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  bool? success;
  String? message;
  String? token;
  User? user;

  AuthModel({this.success, this.message, this.token, this.user});

  factory AuthModel.fromJson(Map<String, dynamic>? json) => AuthModel(
    success: json?["success"],
    message: json?["message"],
    token: json?["token"],
    user:
        json?["user"] != null
            ? User.fromJson(json?["user"])
            : json?["data"] != null
            ? User.fromJson(json?["data"])
            : null,
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "token": token,
    "user": user?.toJson(),
  };
}

class User {
  String? id;
  String? phone;
  bool? isVerified;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? role;
  String? address;
  String? email;
  String? gender;
  String? landmark;
  String? name;
  String? pincode;

  User({
    this.id,
    this.phone,
    this.isVerified,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.role,
    this.address,
    this.email,
    this.gender,
    this.landmark,
    this.name,
    this.pincode,
  });

  factory User.fromJson(Map<String, dynamic>? json) => User(
    id: json?["_id"],
    phone: json?["phone"],
    isVerified: json?["isVerified"],
    isActive: json?["isActive"],
    createdAt:
        json?["createdAt"] != null
            ? DateTime.tryParse(json?["createdAt"])
            : null,
    updatedAt:
        json?["updatedAt"] != null
            ? DateTime.tryParse(json?["updatedAt"])
            : null,
    v: json?["__v"],
    role: json?["role"],
    address: json?["address"],
    email: json?["email"],
    gender: json?["gender"],
    landmark: json?["landmark"],
    name: json?["name"],
    pincode: json?["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "phone": phone,
    "isVerified": isVerified,
    "isActive": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "role": role,
    "address": address,
    "email": email,
    "gender": gender,
    "landmark": landmark,
    "name": name,
    "pincode": pincode,
  };
}
