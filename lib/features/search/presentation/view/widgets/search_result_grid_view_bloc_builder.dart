
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/get_dummy_product.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../home/presentation/views/widgets/products_grid_view.dart';

class SearchResultGridViewBuilder extends StatelessWidget {
  const SearchResultGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductCubit, GetProductState>(
        builder: (context, state) {
      if (state is GetProductSuccess) {
        return ProductsGridView(
          products: state.products,
        );
      } else if (state is GetProductLoading) {
        return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(
              products: getDummyProducts(),
            ));
      } else if (state is GetProductFailed) {
        return SliverToBoxAdapter(
          child: Center(
            child: SvgPicture.asset(
              Assets.imagesSearchfailed,
            ),
          ),
        );
      } else {
        return const SliverToBoxAdapter(
            child: Center(
                child: Text(
          'Search',
        )));
      }
    });
  }
}
