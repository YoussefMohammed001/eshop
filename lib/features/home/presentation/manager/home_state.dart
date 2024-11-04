part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {
  HomeLoading();

}
final class HomeSuccess extends HomeState {
  final HomeEntities homeEntities;
  HomeSuccess(this.homeEntities);
}
final class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}
