import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/features/fruit_details/presentation/view/widgets/expiry_date.dart';
import 'package:flutter/material.dart';

import 'calories_widget.dart';
import 'organic_widget.dart';
import 'reviews_widget.dart';

class FruitDetailsGridView extends StatelessWidget {
  const FruitDetailsGridView({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 160 / 80,
      ),
      children: [
        ExpiryDate(
          expiryInMonths: productEntity.expirationInMonths,
        ),
        const OrganicWidget(),
        CaloriesWidget(
            calories: productEntity.calories,
            unitAmount: productEntity.unitAmount),
        ReviewsWidget(
            avgRating: productEntity.avgRating,
            numRating: productEntity.numRating)
      ],
    );
  }
}
