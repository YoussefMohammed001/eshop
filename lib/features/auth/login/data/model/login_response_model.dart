import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponse {
  bool? status;
  String? message;
  UserData? data;

  // Singleton instance
  static final LoginResponse _instance = LoginResponse._internal();

  // Private constructor
  LoginResponse._internal();

  // Factory constructor to return the same instance
  factory LoginResponse() {
    return _instance;
  }

  // Method to populate the singleton instance from JSON
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    _instance.status = json['status'];
    _instance.message = json['message'];
    _instance.data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    return _instance;
  }

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}