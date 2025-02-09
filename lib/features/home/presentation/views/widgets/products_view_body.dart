import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/widgets/custom_appbar.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/cubit/product_view_screens_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'best_seller_grid_view_bloc_builder.dart';
import 'our_products.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<GetProductCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [ customAppBar(
            arrowBackExist: false,
            title: 'المنتجات',
            context: context,
            notificationsActivated: true),
                SizedBox(
                  height: 16,
                ),
                SearchTextField(
                  onPressed: () {
                    context.read<ProductViewScreensCubit>().changeIndex(1);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                OurProducts(),
                SizedBox(
                  height: 24,
                ),
                BestSellingHeader(),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          BestSellingGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
