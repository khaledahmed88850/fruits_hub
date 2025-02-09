
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import 'our_products_list_view.dart';

class OurProducts extends StatelessWidget {
  const OurProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
           const   Text(
                'منتجاتنا',
                style: Styles.bold16,
              ),
              SvgPicture.asset(Assets.imagesSortingOptions),
            ]),
       const SizedBox(
          height: 8,
        ),
      const  OurProductsListView()
      ],
    );
  }
}
