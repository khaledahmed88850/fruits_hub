import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'تمتلك حساب بالفعل؟ ',
          style: Styles.semiBold16.copyWith(color: const Color(0xff949D9E)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'تسجيل دخول',
            style: Styles.semiBold16.copyWith(color: kDarkPrimaryColor),
          ),
        )
      ],
    );
  }
}
