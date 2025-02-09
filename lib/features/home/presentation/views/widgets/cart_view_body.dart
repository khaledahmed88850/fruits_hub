import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_appbar.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

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
                'لديك 3 منتجات في سله التسوق',
                style: Styles.regular13.copyWith(color: kDarkPrimaryColor),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: List.generate(3, (index) => const CartItem()),
          ),
          const Divider(
            color: Color(0xffF1F1F5),
            thickness: 1,
          ),
          const SizedBox(
            height: 140,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(text: 'الدفع 120 جنية'),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
