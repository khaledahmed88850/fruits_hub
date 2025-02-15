import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_appbar.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../checkout/presentation/view/checkout_view.dart';
import 'cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          customAppBar(
              onBackPressed: () {
                Navigator.pop(context);
              },
              context: context,
              title: 'السلة'),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 40,
            width: double.infinity,
            color: const Color(0xffEBF9F1),
            child: Center(
              child: Text(
                'لديك ${context.read<CartCubit>().cartEntity.cartEntityList.length} منتجات في سله التسوق',
                style: Styles.regular13.copyWith(color: kDarkPrimaryColor),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: List.generate(
                context.watch<CartCubit>().cartEntity.cartEntityList.length,
                (index) => CartItem(
                      cartItemEntity: context
                          .read<CartCubit>()
                          .cartEntity
                          .cartEntityList[index],
                    )),
          ),
          Visibility(
            visible:
                context.read<CartCubit>().cartEntity.cartEntityList.isNotEmpty
                    ? true
                    : false,
            child: const Divider(
              color: Color(0xffF1F1F5),
              thickness: 1,
            ),
          ),
          const SizedBox(
            height: 140,
          ),
          Visibility(
            visible:
                context.read<CartCubit>().cartEntity.cartEntityList.isNotEmpty
                    ? true
                    : false,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: CustomButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CheckoutView.routeName,
                        arguments: context.read<CartCubit>().cartEntity);
                  },
                  text:
                      'الدفع ${context.read<CartCubit>().cartEntity.calculateCheckout()} جنية'),
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
