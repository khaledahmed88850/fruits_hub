import 'package:e_commerce_app/core/helper_functions/build_error.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/create_user_cubit/create_user_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateUserCubit, CreateUserState>(
      listener: (context, state) {
        if (state is CreateUserSuccess) {

        }
        if (state is CreateUserFailure) {
          buildError(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is CreateUserLoading ? true : false,
            child: const SignupViewBody());
      },
    );
  }


}
