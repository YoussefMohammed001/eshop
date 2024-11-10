part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class ToggleFavoriteLoading extends FavoriteState {}


final class ToggleFavoriteSuccess extends FavoriteState {
  final String message;
  ToggleFavoriteSuccess({required this.message,});
}


final class ToggleFavoriteFailure extends FavoriteState {
  final String message;
  ToggleFavoriteFailure({required this.message});
}

class GetFavLoading extends FavoriteState {}

class GetFavSuccess extends FavoriteState {
  final FavoritesResponse favoritesResponse;
  GetFavSuccess({required this.favoritesResponse});
}

class GetFavFailure extends FavoriteState {
final String errorMessage;
  GetFavFailure({required this.errorMessage});
}


