import 'package:e_commerce_app/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 0});

  num totalPrice() => productEntity.price * count;
  increaseCount() => count++;
  decreaseCount() => count--;
}
