import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(cartEntityList: []);
  void addProductToCart(ProductEntity productEntity) {
    cartEntity.addProductToCart(productEntity);
    emit(CartProductAdded());
  }

  void decreaseProductAmountFromCart(ProductEntity productEntity) {
    cartEntity.decreaseProductAmountFromCart(productEntity);
    emit(CartProductDecreased());
  }

  void removeProductFromCart(ProductEntity productEntity) {
    cartEntity.removeProductFromCart(productEntity);
    emit(CartProductRemoved());
  }

  int getCount(ProductEntity productEntity) {
    int count = cartEntity.getCount(productEntity);
    return count;
  }
}
