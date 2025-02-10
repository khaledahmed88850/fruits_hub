import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entities/navigation_bar_entity.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.navigationBarEntity});
  final NavigationBarEntity navigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffEEEEEE),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: kDarkPrimaryColor,
              child: SvgPicture.asset(navigationBarEntity.activeImage),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              navigationBarEntity.title,
              style: Styles.semiBold11.copyWith(color: kDarkPrimaryColor),
            ),
            const SizedBox(
              width: 7,
            ),
          ],
        ),
      ),
    );
  }
}
