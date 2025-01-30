import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/widgets/or_divider.dart';
import 'package:e_commerce_app/features/auth/data/cubits/login_cubit/login_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'dont_have_acount.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  bool obscureText = true ;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  password = value!;
                },
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
                  },
                  child: const Icon(Icons.visibility_sharp)),
                obscureText: obscureText,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('نسيت كلمة المرور؟',
                      style: Styles.semiBold13
                          .copyWith(color: kLightPrimaryColor)),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      autovalidateMode = AutovalidateMode.disabled;
                      BlocProvider.of<LoginCubit>(context)
                          .loginUser(email: email, password: password);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: 'تسجيل دخول'),
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
                title: 'تسجيل بواسطة جوجل',
                iconImage: Assets.imagesGoogleIcon,
              ),
              const SizedBox(
                height: 16,
              ),
              const SocialLoginButton(
                title: 'تسجيل بواسطة ابل',
                iconImage: Assets.imagesAppleIcon,
              ),
              const SizedBox(
                height: 16,
              ),
              const SocialLoginButton(
                title: 'تسجيل بواسطة فيسبوك',
                iconImage: Assets.imagesFacebookIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
