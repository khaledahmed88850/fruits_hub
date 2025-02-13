import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class SelectedStep extends StatelessWidget {
  const SelectedStep({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 11.5,
          backgroundColor: kPrimaryColor,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 18,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: Styles.bold13.copyWith(color: kDarkPrimaryColor),
        ),
      ],
    );
  }
}
