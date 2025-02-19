import 'package:e_commerce_app/features/auth/presentation/views/widgets/get_dummy_product.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({
    super.key,
  });

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
        return const SliverToBoxAdapter(
          child: Center(
              child: Text(
            'Something went wrong',
          )),
        );
      }
      else {
        return const SliverToBoxAdapter(
          child: Center(
              child: Text(
            'Something went wrong',
          )),
        );
      }
    });
  }
}
