import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/widgets/custom_appbar.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_grid_view_bloc_builder.dart';
import 'products_result_header.dart';

class ProductsViewResults extends StatefulWidget {
  const ProductsViewResults({super.key});

  @override
  State<ProductsViewResults> createState() => _ProductsViewResultsState();
}

class _ProductsViewResultsState extends State<ProductsViewResults> {
  @override
  void initState() {
    context.read<GetProductCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                customAppBar(
                    onBackPressed: () {},
                    arrowBackExist: false,
                    title: 'المنتجات',
                    context: context,
                    notificationsActivated: true),
                const SizedBox(
                  height: 16,
                ),
                const SearchTextField(),
                const SizedBox(
                  height: 16,
                ),
                const ProductsResultHeader(),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          const BestSellingGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
