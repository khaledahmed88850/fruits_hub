import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            
            color: Color(0xffDDDFDF),
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text('أو', style: Styles.semiBold16,),
        ),
          Expanded(
          child: Divider(
            
            color: Color(0xffDDDFDF),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}