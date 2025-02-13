
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartEntityList;
  toMap()
  {
    return cartEntityList.map((e) => e.toMap()).toList();
  }

  CartEntity({required this.cartEntityList});
  void addProductToCart(ProductEntity productEntity) {
    bool isExist = isexist(productEntity);
    if (isExist) {
      for (var item in cartEntityList) {
        if (item.productEntity == productEntity) {
          item.increaseCount();
        }
      }
    } else {
      CartItemEntity cartItemEntity =
          CartItemEntity(productEntity: productEntity, count: 1);
      cartEntityList.add(cartItemEntity);
    }
  }

  bool isexist(ProductEntity productEntity) {
    for (var item in cartEntityList) {
      if (item.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }

  double calculateCheckout() {
    double total = 0;
    for (var item in cartEntityList) {
      total += item.totalPrice();
    }
    return total;
  }

  decreaseProductAmountFromCart(ProductEntity productEntity) {
    for (var item in cartEntityList) {
      if (item.productEntity == productEntity) {
        if (item.count > 1) {
          item.decreaseCount();
        } else {
          cartEntityList.remove(item);
          break;
        }
      }
    }
  }

  removeProductFromCart(ProductEntity productEntity) {
    for (var item in cartEntityList) {
      if (item.productEntity == productEntity) {
        cartEntityList.remove(item);
        break;
      }
    }
  }

  int getCount(ProductEntity productEntity) {
    for (var item in cartEntityList) {
      if (item.productEntity == productEntity) {
        return item.count;
      }
    }
    return 0;
  }
}
