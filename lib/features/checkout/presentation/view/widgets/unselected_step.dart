
 import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class UnselectedStep extends StatelessWidget {
  const UnselectedStep({super.key, required this.title, required this.index});
final String title , index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor:const Color(0xffF2F3F3),
          child: Text(index , style: Styles.semiBold13.copyWith(color: Colors.black),),
          
        ),
       const SizedBox(width: 4,),
        Text(title , style: Styles.bold13.copyWith(color:const Color(0xffAAAAAA)),),
      ],
    );
  }
}