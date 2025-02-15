import 'package:e_commerce_app/features/checkout/domain/entities/address_entity.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';

class OrderModel {
  final CartEntity cartEntity;
  AddressEntity addressEntity;
  bool? payWithCash;

  OrderModel(
      {required this.addressEntity,
      this.payWithCash,
      required this.cartEntity});
  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
      addressEntity: orderEntity.addressEntity,
      cartEntity: orderEntity.cartEntity,
      payWithCash: orderEntity.payWithCash,
    );
  }
  toMap() {
    return {
      "cart": cartEntity.toMap(),
      "address": addressEntity.toMap(),
      "payWithCash": payWithCash
    };
  }
}
