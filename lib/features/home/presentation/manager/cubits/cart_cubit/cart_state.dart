part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartProductAdded extends CartState {}

final class CartProductDecreased extends CartState {}

final class CartProductRemoved extends CartState {}
