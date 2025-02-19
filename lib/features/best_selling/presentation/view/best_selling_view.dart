import 'package:e_commerce_app/core/helper_functions/get_it_function.dart';
import 'package:e_commerce_app/core/repo/product_repo/product_repo.dart';
import 'package:e_commerce_app/core/widgets/custom_appbar.dart';
import 'package:e_commerce_app/features/best_selling/presentation/view/widgets/best_selling_view_body.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = 'best-selling';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProductCubit(getIt<ProductRepo>()),
      child: Scaffold(
        appBar: customAppBar(
            onBackPressed: () {
              Navigator.pop(context);
            },
            context: context,
            title: 'الأكثر مبيعًا',
            notificationsActivated: true),
        body: const BestSellingViewBody(),
      ),
    );
  }
}
