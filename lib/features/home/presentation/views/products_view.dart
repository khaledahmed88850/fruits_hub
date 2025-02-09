import 'package:e_commerce_app/core/helper_functions/get_it_function.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/cubit/product_view_screens_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_view_body.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_view_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/repo/product_repo/product_repo.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});
  static const String routeName = 'productsView';

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  List<Widget> productViewScreens = [
    const ProductsViewBody(),
    const ProductsViewResults(),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetProductCubit(
            getIt<ProductRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => ProductViewScreensCubit(),
        ),
      ],
      child: BlocBuilder<ProductViewScreensCubit, int>(
          builder: (context, state) {
            return productViewScreens[state];
          },
        ),
    );
  }
}
