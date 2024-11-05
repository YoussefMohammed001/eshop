part of 'category_products_cubit.dart';

@immutable
sealed class CategoryProductsState {}

final class CategoryProductsInitial extends CategoryProductsState {}


final class CategoryLoading extends CategoryProductsState {}
final class CategorySuccess extends CategoryProductsState {}
final class CategoryError extends CategoryProductsState {}


final class ProductLoading extends CategoryProductsState {}
final class ProductSuccess extends CategoryProductsState {}
final class ProductError extends CategoryProductsState {}
