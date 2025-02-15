import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 9,
        ),
        Text(
          productEntity.avgRating.toString(),
          style: Styles.semiBold13,
        ),
        const SizedBox(
          width: 9,
        ),
        Text(
          '(${productEntity.numRating})',
          style: Styles.regular13.copyWith(color: const Color(0xff9796A1)),
        ),
        const SizedBox(
          width: 9,
        ),
        Text(
          'المراجعه',
          style: Styles.bold13.copyWith(color: kDarkPrimaryColor),
        ),
      ],
    );
  }
}
