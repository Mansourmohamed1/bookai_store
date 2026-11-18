part of 'product_details_cubit.dart';


sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}
final class ProductDetailsLoading extends ProductDetailsState {}
final class ProductDetailsSuccess extends ProductDetailsState {}
final class ProductDetailsError extends ProductDetailsState {
  final String message;
  ProductDetailsError(this.message);
}