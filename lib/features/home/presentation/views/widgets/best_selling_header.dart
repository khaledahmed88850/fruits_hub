import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/best_selling/presentation/view/best_selling_view.dart';
import 'package:flutter/material.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'الأكثر مبيعًا',
          style: Styles.bold16,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(BestSellingView.routeName);
          },
          child: Text(
            'المزيد',
            style: Styles.regular13.copyWith(
              color: const Color(0xff949D9E),
            ),
          ),
        ),
      ],
    );
  }
}
