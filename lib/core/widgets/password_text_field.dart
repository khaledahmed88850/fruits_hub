
import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        obscureText: obscureText,
        onSaved: widget.onSaved,
        hintText: "كلمة المرور",
        textInputType: TextInputType.visiblePassword,
        suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 35),
            child: GestureDetector(
              onTap: () {
                obscureText = !obscureText;
                setState(() {});
              },
              child: obscureText
                  ? const Icon(Icons.visibility_sharp)
                  : const Icon(Icons.visibility_off_sharp),
            )));
  }
}
