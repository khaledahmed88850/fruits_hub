import 'package:flutter/material.dart';

class InActiveDot extends StatelessWidget {
  const InActiveDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xff949D9E)),
            borderRadius: BorderRadius.circular(32),
          )),
    );
  }
}
