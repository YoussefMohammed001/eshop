import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  bool? status;
  String? message;
  UserData? data;

  // Singleton instance
  static final RegisterResponse _instance = RegisterResponse._internal();

  // Private constructor
  RegisterResponse._internal();

  // Factory constructor to return the singleton instance
  factory RegisterResponse() {
    return _instance;
  }

  // Populate the singleton from JSON
  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    _instance.status = json['status'];
    _instance.message = json['message'];
    _instance.data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    return _instance;
  }

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;

  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}