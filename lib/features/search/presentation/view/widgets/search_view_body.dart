import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/search_text_field.dart';
import 'package:e_commerce_app/features/search/presentation/view/widgets/search_result_grid_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              SearchTextField(
                onSubmitted: (value) {
                  context.read<GetProductCubit>().getProductByName(value);
                },
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          )),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'نتيجة البحث',
                  style: Styles.regular13.copyWith(color: const Color(0xff949D9E)),
                ),
              const  SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          const SearchResultGridViewBuilder(),
        ],
      ),
    );
  }
}
