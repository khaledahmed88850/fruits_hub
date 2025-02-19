import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellingViewBody extends StatefulWidget {
  const BestSellingViewBody({super.key});

  @override
  State<BestSellingViewBody> createState() => _BestSellingViewBodyState();
}

class _BestSellingViewBodyState extends State<BestSellingViewBody> {
  @override
  void initState() {
    context.read<GetProductCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child:  CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Text(
                    'الأكثر مبيعًا',
                    style: Styles.bold16,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        ProductsGridViewBlocBuilder(),
      ]),
    );
  }
}
