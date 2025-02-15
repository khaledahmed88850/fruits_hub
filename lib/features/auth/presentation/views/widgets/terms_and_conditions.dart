import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({
    super.key,
    required this.onChanged,
  });
  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(14, 0),
      child: Row(
        children: [
          Checkbox(
            side: const BorderSide(color: Color(0xffC9CECF)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            onChanged: (value) {
              isChecked = value!;
              widget.onChanged(value);
              setState(() {});
            },
            value: isChecked,
          ),
          Expanded(
            child: Text.rich(TextSpan(children: [
              TextSpan(
                text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                style:
                    Styles.semiBold13.copyWith(color: const Color(0xff949D9E)),
              ),
              TextSpan(
                text: 'الشروط والأحكام الخاصة بنا',
                style: Styles.semiBold13.copyWith(color: kLightPrimaryColor),
              )
            ])),
          ),
        ],
      ),
    );
  }
}
