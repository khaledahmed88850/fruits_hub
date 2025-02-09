import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/cart_item_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

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
                  child: Image.asset(
                    Assets.imagesWatermelonTest,
                  )),
              const SizedBox(
                width: 27,
              ),
              Expanded(
                child: Column(children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    title: const Text(
                      'بطيخ',
                      style: Styles.bold13,
                    ),
                    subtitle: Text(
                      '3 كم',
                      style: Styles.regular13.copyWith(color: Colors.orange),
                    ),
                    trailing: SvgPicture.asset(Assets.imagesTrash),
                  ),
                  Row(
                    children: [
                    const  CartItemActionButton(
                        icon: Icons.add,
                        iconColor: Colors.white,
                        backgroundColor: kDarkPrimaryColor,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        '3',
                        style: Styles.bold16,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                   const   CartItemActionButton(
                        backgroundColor: Color(0xffF3F5F7),
                        icon: Icons.remove,
                        iconColor: Color(0xff979899),
                      ),
                      const Spacer(),
                      Text(
                        '60 جنية',
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
