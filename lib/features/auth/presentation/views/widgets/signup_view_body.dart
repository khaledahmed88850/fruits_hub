import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'have_an_account.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const CustomTextFormField(
              hintText: 'الاسم كامل', textInputType: TextInputType.text),
          const CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress),
          const CustomTextFormField(
              hintText: "كلمة المرور",
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Padding(
                padding: EdgeInsets.only(left: 35),
                child: Icon(Icons.visibility_sharp),
              )),
          TermsAndConditions(),
          SizedBox(
            height: 30,
          ),
          CustomButton(text: 'إنشاء حساب جديد', onPressed: () {}),
          SizedBox(
            height: 26,
          ),
          HaveAnAccount()
        ],
      ),
    ));
  }
}
