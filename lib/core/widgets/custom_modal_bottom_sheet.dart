import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_range_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/assets.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Color(0x2A00000A),
              offset: Offset(0, -2),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Container(
                height: 3,
                width: 60,
                decoration: const BoxDecoration(
                    color: Color(0xff131F46),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Text(
              'تصنيف حسب :',
              style: Styles.bold19,
            ),
            const SizedBox(
              height: 19,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.imagesPriceLogo),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'السعر:',
                    style: Styles.bold13,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 36,
                    width: 135,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xffE6E9E9))),
                    child: const Center(
                      child: Text(
                        '0',
                        style: Styles.regular13,
                      ),
                    ),
                  ),
                  Text(
                    'الي',
                    style: Styles.bold13.copyWith(color: Colors.black),
                  ),
                  Container(
                    height: 36,
                    width: 135,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xffE6E9E9))),
                    child: const Center(
                      child: Text(
                        '0',
                        style: Styles.regular13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CustomRangeSlider(),
            const SizedBox(
              height: 12,
            ),
            CustomButton(onPressed: onPressed, text: 'تصفية'),
          ],
        ),
      ),
    );
  }
}
