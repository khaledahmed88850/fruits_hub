import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/widgets/custom_modal_bottom_sheet.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 9,
          color: Color(0x0100000A),
          offset: Offset(0, 2),
        )
      ]),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          fillColor: const Color(0xFFF9FAFA),
          contentPadding: const EdgeInsets.only(left: 17, top: 12),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
          hintText: 'ابحث عن ....',
          hintStyle: Styles.regular13.copyWith(color: const Color(0xff949D9E)),
          prefixIcon: SizedBox(
              width: 17,
              height: 17,
              child: Center(child: SvgPicture.asset(Assets.imagesSearch))),
          suffixIcon: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CustomModalBottomSheet(
                    
                      onPressed: onPressed,
                    );
                  });
            },
            child: SizedBox(
                width: 20,
                height: 20,
                child: Center(child: SvgPicture.asset(Assets.imagesSetting))),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xffE6E9E9), width: 0.1));
  }
}
