part of 'get_product_cubit.dart';

@immutable
sealed class GetProductState {}

final class GetProductInitial extends GetProductState {}

final class GetProductLoading extends GetProductState {}

final class GetProductSuccess extends GetProductState {
  final List<ProductEntity> products;
  GetProductSuccess({required this.products});
}

final class GetProductFailed extends GetProductState {
  final String message;
  GetProductFailed({required this.message});
}
