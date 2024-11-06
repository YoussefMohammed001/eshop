part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}


final class ProductDetailsLoading extends ProductDetailsState {}
final class ProductDetailsSuccess extends ProductDetailsState {
  final ProductEntities productEntities;

  ProductDetailsSuccess({required this.productEntities});
}
final class ProductDetailsFailure extends ProductDetailsState {}
