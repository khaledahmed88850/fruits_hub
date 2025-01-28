import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/widgets/or_divider.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'dont_have_acount.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
            ),
            const CustomTextFormField(
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icon(Icons.visibility_sharp),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('نسيت كلمة المرور؟',
                    style:
                        Styles.semiBold13.copyWith(color: kLightPrimaryColor)),
              ],
            ),
            const SizedBox(
              height: 33,
            ),
            CustomButton(onPressed: () {}, text: 'تسجيل دخول'),
            const SizedBox(
              height: 33,
            ),
            const DontHaveAcount(),
            const SizedBox(
              height: 37,
            ),
            const OrDivider(),
            const SizedBox(
              height: 16,
            ),
           const SocialLoginButton(
              title:  'تسجيل بواسطة جوجل',
              iconImage: Assets.imagesGoogleIcon,
            ),
            const SizedBox(
              height: 16,
            ),
          const  SocialLoginButton(
              title:  'تسجيل بواسطة ابل',
              iconImage: Assets.imagesAppleIcon,

            ),
            const SizedBox(
              height: 16,
            ),
         const   SocialLoginButton( title:  'تسجيل بواسطة فيسبوك',
            iconImage: Assets.imagesFacebookIcon,
            ),
          ],
        ),
      ),
    );
  }
}
