import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.suffixIcon,
      required this.onSaved,
      this.obscureText = false});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        obscureText: obscureText,
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'برجاء ادخال البيانات';
          }
          return null;
        },
        keyboardType: textInputType,
        decoration: InputDecoration(
            suffixIconColor: const Color(0xffC9CECF),
            suffixIcon: suffixIcon,
            fillColor: const Color(0xffF9FAFA),
            hintText: hintText,
            hintStyle: Styles.bold13.copyWith(color: const Color(0xff949D9E)),
            border: buildBorder(),
            enabledBorder: buildBorder()),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
          color: Color(
            0xffE6E9EA,
          ),
          width: 1),
      borderRadius: BorderRadius.circular(4),
    );
  }
}
