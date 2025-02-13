import 'package:e_commerce_app/core/helper_functions/build_error.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_view_body.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = 'MainView';

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartProductAdded) {
            buildError(context, 'تم اضافة المنتج بنجاح',
                color: kDarkPrimaryColor);
          } else if (state is CartProductRemoved) {
            buildError(context, 'تم حذف المنتج بنجاح');
          }
        },
        child: const MainViewBody());
  }
}
