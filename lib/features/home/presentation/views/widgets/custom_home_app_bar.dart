import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helper_functions/get_user_data.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesUserAvatar),
      trailing: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffEEF8ED),
          ),
          child: SvgPicture.asset(
            Assets.imagesNotifications,
          )),
      title: Text(
        'صباح الخير !..',
        style: Styles.regular16.copyWith(color: const Color(0xff949D9E)),
      ),
      subtitle:  Text(
        getUser().name,
        style: Styles.bold16,
      ),
    );
  }
}
