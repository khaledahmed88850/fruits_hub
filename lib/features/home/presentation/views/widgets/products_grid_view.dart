import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:flutter/material.dart';

import 'fruit_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        childAspectRatio: 163 / 214,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return FruitItem(
          productEntity: products[index],
        );
      },
    );
  }
}
