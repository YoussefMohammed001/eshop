import 'package:eshop/features/auth/login/data/model/login_response_model.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}
final class LoginLoaded extends LoginState {
  LoginLoaded();
}
final class LoginFailure extends LoginState {
  final String message;

  LoginFailure({required this.message});
}



