import 'package:e_commerce_app/features/home/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_result_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../auth/presentation/views/widgets/get_dummy_product.dart';

class ProductResultGridViewBlocBuilder extends StatelessWidget {
  const ProductResultGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductCubit, GetProductState>(
      builder: (context, state) {
        if (state is GetProductSuccess) {
           return MultiSliver(
            children: [
              SliverToBoxAdapter(child:  ProductsResultHeader(length: state.products.length)),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              ProductsGridView(products: state.products),
            ],
          );
          
        } else if (state is GetProductLoading) {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(products: getDummyProducts()),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: Text('Something went wrong')),
          );
        }
      },
    );
  }
}
