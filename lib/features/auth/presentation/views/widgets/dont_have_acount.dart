
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utils/app_colors.dart';

class DontHaveAcount extends StatelessWidget {
  const DontHaveAcount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا تمتلك حساب؟',
          style: Styles.semiBold16.copyWith(
            color: const Color(0xff616A6B),
          ),
        ),
        Text(
      ' قم بإنشاء حساب',
          style: Styles.semiBold16.copyWith(
            color:kDarkPrimaryColor,
          ),
        ),
      ],
    );
  }
}
