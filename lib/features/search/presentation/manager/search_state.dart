part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}
final class SearchSuccess extends SearchState {}
final class SearchFailure extends SearchState {
  final String message;
  SearchFailure({required this.message});
}
