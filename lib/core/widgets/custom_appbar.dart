import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


AppBar customAppBar(
    {required void Function()? onBackPressed,
    bool arrowBackExist = true,
    required BuildContext context,
    required String title,
    bool notificationsActivated = false,
   }) {
  return AppBar(
    backgroundColor: Colors.transparent,
    scrolledUnderElevation: 0,
    elevation: 0,
    leading: arrowBackExist
        ? IconButton(
            onPressed: onBackPressed,
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp, 
            ))
        : const SizedBox.shrink(),
    title: Text(
      title,
      style: Styles.bold19,
    ),
    centerTitle: true,
    actions: notificationsActivated
        ? [
            IconButton(
              icon:  SvgPicture.asset (
                Assets.imagesNotifications
              ),
              onPressed: () {},
            ),
          ]
        : [],
    
  );
}
