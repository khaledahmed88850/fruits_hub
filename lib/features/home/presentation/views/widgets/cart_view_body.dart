import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_appbar.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          customAppBar(context: context, title: 'السلة'),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 40,
            width: double.infinity,
            color: const Color(0xffEBF9F1),
            child: Center(
              child: Text(
                'لديك ${context.watch<CartCubit>().cartEntity.cartEntityList.length} منتجات في سله التسوق',
                style: Styles.regular13.copyWith(color: kDarkPrimaryColor),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: List.generate(
                cartEntity.cartEntityList.length,
                (index) => CartItem(
                      cartItemEntity: cartEntity.cartEntityList[index],
                    )),
          ),
          Visibility(
            visible: cartEntity.cartEntityList.isNotEmpty ? true : false,
            child: const Divider(
              color: Color(0xffF1F1F5),
              thickness: 1,
            ),
          ),
          const SizedBox(
            height: 140,
          ),
          Visibility(
            visible: cartEntity.cartEntityList.isNotEmpty ? true : false,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: CustomButton(
                  text: 'الدفع ${cartEntity.calculateCheckout()} جنية'),
            ),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
