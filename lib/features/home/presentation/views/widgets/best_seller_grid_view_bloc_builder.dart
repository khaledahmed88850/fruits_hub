import 'package:e_commerce_app/features/auth/presentation/views/widgets/get_dummy_product.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingGridViewBlocBuilder extends StatelessWidget {
  const BestSellingGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductCubit, GetProductState>(
        builder: (context, state) {
      if (state is GetProductSuccess) {
        return BestSellingGridView(
          products: state.products,
        );
      }
      if (state is GetProductLoading) {
        return Skeletonizer.sliver(
            enabled: true,
            child: BestSellingGridView(
              products: getDummyProducts(),
            ));
      } else {
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
