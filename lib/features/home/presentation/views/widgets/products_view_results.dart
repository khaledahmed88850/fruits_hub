import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/product_result_grid_view_bloc_builder.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsResultViewBody extends StatefulWidget {
  const ProductsResultViewBody({super.key});

  @override
  State<ProductsResultViewBody> createState() => _ProductsResultViewBodyState();
}

class _ProductsResultViewBodyState extends State<ProductsResultViewBody> {
  @override
  void initState() {
    context.read<GetProductCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                SearchTextField(),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          ProductResultGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
