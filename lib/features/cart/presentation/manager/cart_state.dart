part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}



final class GetCartLoading extends CartState {}
final class GetCartSuccess extends CartState {}
final class GetCartFailure extends CartState {}
