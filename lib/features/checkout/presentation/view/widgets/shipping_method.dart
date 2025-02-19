import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'active_dot.dart';
import 'in_active_dot.dart';

class ShippingMethod extends StatelessWidget {
  const ShippingMethod(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.isSelected,
      required this.onTap});
  final String title, subtitle, price;
  final bool isSelected;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicHeight(
        child: AnimatedContainer(
          padding: const EdgeInsets.all(18),
          duration: const Duration(milliseconds: 300),
          decoration: ShapeDecoration(
              color: const Color(0xffD9D9D9).withValues(alpha: 0.2),
              shape: isSelected
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side:
                          const BorderSide(width: 1, color: kDarkPrimaryColor),
                    )
                  : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    )),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isSelected ? const ActiveDot() : const InActiveDot(),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: Styles.semiBold13,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      subtitle,
                      style: Styles.regular13
                          .copyWith(color: const Color.fromRGBO(0, 0, 0, 0.5)),
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: Text(
                    price,
                    style: Styles.bold13.copyWith(color: kLightPrimaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
