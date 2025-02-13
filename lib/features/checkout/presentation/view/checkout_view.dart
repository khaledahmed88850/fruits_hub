import 'package:e_commerce_app/core/helper_functions/get_it_function.dart';
import 'package:e_commerce_app/features/checkout/data/repo/order_repo.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/address_entity.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/manager/cubits/order_cubit/order_cubit.dart';
import 'package:e_commerce_app/features/checkout/presentation/view/widgets/checkout_view_body.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = '/checkout';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(getIt<OrderRepo>()),
      child: Scaffold(
        body: Provider.value(
          value: OrderEntity(
              cartEntity: cartEntity, addressEntity: AddressEntity()),
          child: const CheckoutViewBody(),
        ),
      ),
    );
  }
}
