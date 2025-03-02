import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/widgets/custom_appbar.dart';
import 'package:e_commerce_app/features/home/presentation/views/products_result_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'products_grid_view_bloc_builder.dart';
import 'our_products.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
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
                SearchTextField(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, ProductsResultView.routeName);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const OurProducts(),
                const SizedBox(
                  height: 24,
                ),
                const BestSellingHeader(),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          const ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
