import 'package:e_commerce_app/features/home/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'our_product_item.dart';

class OurProductsListView extends StatelessWidget {
  const OurProductsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: BlocBuilder<GetProductCubit, GetProductState>(
        builder: (context, state) {
          if (state is GetProductSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: OurProductItem(
                    productEntity: state.products[index],
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
