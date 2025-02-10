import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return CartViewBody(
      cartEntity: CartEntity(cartEntityList: context.read<CartCubit>().cartEntity.cartEntityList),
    );
  }
}
