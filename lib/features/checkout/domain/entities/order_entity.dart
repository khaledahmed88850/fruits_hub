import 'package:e_commerce_app/features/checkout/domain/entities/address_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  AddressEntity addressEntity;
  bool? payWithCash;

  OrderEntity(
      {required this.addressEntity,
      this.payWithCash,
      required this.cartEntity});
}
