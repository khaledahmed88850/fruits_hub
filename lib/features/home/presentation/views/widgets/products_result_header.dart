import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';

class ProductsResultHeader extends StatelessWidget {
  const ProductsResultHeader({
    super.key, required this.length,
  });
  final int length ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          '$length نتائج',
          style: Styles.bold16,
        ),
        SvgPicture.asset(Assets.imagesSortingOptions),
      ],
    );
  }
}
