import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/cart_item_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../domain/entities/cart_item_entity.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItemEntity,
  });
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Color(0xffF1F1F5),
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Row(
            children: [
              Container(
                  height: 92,
                  width: 73,
                  color: const Color(0xffF3F5F7),
                  child: CachedNetworkImage(
                    imageUrl: cartItemEntity.productEntity.imageUrl!,
                  )),
              const SizedBox(
                width: 27,
              ),
              Expanded(
                child: Column(children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    title: Text(
                      cartItemEntity.productEntity.name,
                      style: Styles.bold13,
                    ),
                    subtitle: Text(
                      '${cartItemEntity.count} كم',
                      style: Styles.regular13.copyWith(color: Colors.orange),
                    ),
                    trailing: GestureDetector(
                        onTap: () {
                          context.read<CartCubit>().removeProductFromCart(
                              cartItemEntity.productEntity);
                        },
                        child: SvgPicture.asset(Assets.imagesTrash)),
                  ),
                  Row(
                    children: [
                      CartItemActionButton(
                        onTap: () {
                          context
                              .read<CartCubit>()
                              .addProductToCart(cartItemEntity.productEntity);
                        },
                        icon: Icons.add,
                        iconColor: Colors.white,
                        backgroundColor: kDarkPrimaryColor,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        cartItemEntity.count.toString(),
                        style: Styles.bold16,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      CartItemActionButton(
                        onTap: () {
                          context
                              .read<CartCubit>()
                              .decreaseProductAmountFromCart(
                                  cartItemEntity.productEntity);
                        },
                        backgroundColor: const Color(0xffF3F5F7),
                        icon: Icons.remove,
                        iconColor: const Color(0xff979899),
                      ),
                      const Spacer(),
                      Text(
                        '${cartItemEntity.totalPrice()} جنية',
                        style: Styles.bold16
                            .copyWith(color: const Color(0xffF4A91F)),
                      ),
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
      ],
    );
  }
}
