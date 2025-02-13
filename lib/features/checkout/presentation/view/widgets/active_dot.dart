
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class ActiveDot extends StatelessWidget {
  const ActiveDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: ShapeDecoration(
          color: kDarkPrimaryColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 4, color: Colors.white),
            borderRadius: BorderRadius.circular(32),
          )),
    );
  }
}
