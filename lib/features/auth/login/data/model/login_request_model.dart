import 'package:json_annotation/json_annotation.dart';
part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel {
  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'password')
  String password;

  LoginRequestModel({
    required this.email,
    required this.password,
  });

  // Convert JSON to Dart object
  factory LoginRequestModel.fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);

  // Convert Dart object to JSON
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}