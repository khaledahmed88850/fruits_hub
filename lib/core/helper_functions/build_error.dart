import 'package:flutter/material.dart';

bool isSnackBarOpen = false;

void buildError(BuildContext context, String message,
    {Color color = Colors.grey}) {
  if (!isSnackBarOpen) {
    isSnackBarOpen = true;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
          duration: const Duration(milliseconds: 400),
          content: Text(message),
          backgroundColor: color,
        ))
        .closed
        .then((value) => isSnackBarOpen = false);
  }
}
