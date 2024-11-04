part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}


final class RegisterLoading extends RegisterState {}
final class RegisterLoaded extends RegisterState {
  final String message;
  RegisterLoaded(this.message);
}
final class RegisterFailed extends RegisterState {
  final String message;

  RegisterFailed({required this.message});
}
