import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key, required this.title, required this.iconImage, this.onPressed});
  final String title;
  final String iconImage;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xffDDDFDF)),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: onPressed ,
          child: ListTile(
            visualDensity: const VisualDensity(
              vertical: VisualDensity.minimumDensity,
            ),
            leading: SvgPicture.asset(iconImage),
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: Styles.semiBold16,
            ),
          )),
    );
  }
}
