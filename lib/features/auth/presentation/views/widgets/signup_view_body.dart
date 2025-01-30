import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/helper_functions/build_error.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/auth/data/cubits/create_user_cubit/create_user_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/password_text_field.dart';
import 'have_an_account.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late String email, password, name;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool istermsChecked = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.text),
              CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress),
              PasswordTextField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              TermsAndConditions(
                onChanged: (value) {
                  istermsChecked = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  text: 'إنشاء حساب جديد',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      autovalidateMode = AutovalidateMode.disabled;
                      formKey.currentState!.save();
                      if (istermsChecked) {
                        BlocProvider.of<CreateUserCubit>(context).createUser(
                            email: email, password: password, name: name);
                      } else {
                        buildError(
                            context, 'يرجى الموافقة على الشروط والأحكام');
                      }
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  }),
              const SizedBox(
                height: 26,
              ),
              const HaveAnAccount()
            ],
          ),
        ),
      ),
    );
  }
}
