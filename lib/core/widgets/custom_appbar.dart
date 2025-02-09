import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/assets.dart';

AppBar customAppBar({ bool arrowBackExist = true  , required BuildContext context, required String title , bool notificationsActivated =false}) {
  return AppBar(
    elevation: 0,
    leading:
    arrowBackExist ?
     IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_sharp,
        ) ) :  const SizedBox.shrink(), 
    title: Text(
      title,
      style: Styles.bold19,
    ),
    centerTitle: true,
    actions:   [
      notificationsActivated ? 
      IconButton(
        onPressed: () {},
        icon: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffEEF8ED),
          ),
          child: SvgPicture.asset(
            Assets.imagesNotifications,
          )),
    ) : const SizedBox.shrink()
    ],
  );
}
