import 'package:e_commerce_app/core/helper_functions/get_it_function.dart';
import 'package:e_commerce_app/core/repo/product_repo/product_repo.dart';
import 'package:e_commerce_app/core/widgets/custom_appbar.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_view_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsResultView extends StatelessWidget {
  const ProductsResultView({super.key});
  static const routeName = '/productsResultView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProductCubit(getIt<ProductRepo>()),
      child: Scaffold(
        appBar: customAppBar(onBackPressed: () => Navigator.pop(context), context: context, title: 'المنتجات'),
        body: const ProductsResultViewBody()),
    );
  }
}
