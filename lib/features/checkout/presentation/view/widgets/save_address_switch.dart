import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/app_colors.dart';

class SaveAddressSwitch extends StatefulWidget {
  const SaveAddressSwitch({
    super.key,
  });

  @override
  State<SaveAddressSwitch> createState() => _SaveAddressSwitchState();
}

class _SaveAddressSwitchState extends State<SaveAddressSwitch> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.75,
          child: CupertinoSwitch(
              activeTrackColor: kDarkPrimaryColor,
              value: isActive,
              onChanged: (value) {
                setState(() {
                  isActive = value;
                });
              }),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          'حفظ العنوان',
          style: Styles.semiBold13.copyWith(color: const Color(0xff949D9E)),
        ),
      ],
    );
  }
}
