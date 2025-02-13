import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class OurProductItem extends StatelessWidget {
  const OurProductItem({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            radius: 32,
            backgroundColor: const Color(0xffF3F5F7),
            child: SizedBox(
              height: 30,
              child: CachedNetworkImage(imageUrl: productEntity.imageUrl!),
            )),
        const SizedBox(
          height: 8,
        ),
        Text(
          productEntity.name,
          style: Styles.semiBold13,
        ),
      ],
    );
  }
}
