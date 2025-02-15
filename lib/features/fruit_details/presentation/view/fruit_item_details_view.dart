import 'package:e_commerce_app/features/fruit_details/presentation/view/widgets/fruit_item_details_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/entities/product_entity.dart';

class FruitItemDetailsView extends StatelessWidget {
  const FruitItemDetailsView({super.key, required this.productEntity});
  static const routeName = '/fruit_item_details_view';
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FruitItemDetailsViewBody(
        productEntity: productEntity,
      ),
    );
  }
}
