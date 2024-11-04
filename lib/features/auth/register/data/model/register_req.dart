import 'package:json_annotation/json_annotation.dart';

part 'register_req.g.dart'; // Part file for generated code

@JsonSerializable()
class RegisterRequestModel {
  final String name;
  final String email;
  final String phone;
  final String password;


  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  // Factory constructor for creating a new instance from a map
  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  // Method for converting an instance to a map
  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}