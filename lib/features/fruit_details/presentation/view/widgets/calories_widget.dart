import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CaloriesWidget extends StatelessWidget {
  const CaloriesWidget(
      {super.key, required this.calories, required this.unitAmount});
  final int calories, unitAmount;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 160,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            width: 1,
            color: Color(0xffF1F1F5),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$calories كالوري',
                style: Styles.bold16.copyWith(
                  color: const Color(0xff23AA49),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '$unitAmount جرام',
                style:
                    Styles.semiBold13.copyWith(color: const Color(0xff979899)),
              ),
            ],
          ),
          SvgPicture.asset(Assets.imagesCalories),
        ],
      ),
    );
  }
}
