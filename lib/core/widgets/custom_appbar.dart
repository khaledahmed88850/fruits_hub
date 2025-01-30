
  import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar customAppBar( {required BuildContext context , required String title}) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
          )),
      title:  Text(
       title,
        style: Styles.bold19,
      ),
      centerTitle: true,
    );
  }