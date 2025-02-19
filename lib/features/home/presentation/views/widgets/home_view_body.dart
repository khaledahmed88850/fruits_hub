import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/get_products_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/featured_item_list_view.dart';
import 'package:e_commerce_app/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'products_grid_view_bloc_builder.dart';
import 'best_selling_header.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetProductCubit>(context).getBestSellingProducts();
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
                const CustomHomeAppBar(),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SearchView.routeName);
                  },
                  child: Container(
                    height: 35,
                    decoration: ShapeDecoration(
                        shadows: const [
                          BoxShadow(
                            blurRadius: 9,
                            color: Color(0x0100000A),
                            offset: Offset(0, 2),
                          )
                        ],
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                                color: Color(0xffE6E9E9), width: 0.1))),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 17,
                            height: 17,
                            child: Center(
                                child: SvgPicture.asset(Assets.imagesSearch))),
                       const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'ابحث عن ....',
                          style: Styles.regular13
                              .copyWith(color: const Color(0xff949D9E)),
                        ),
                      const  Spacer(),
                        SizedBox(
                            width: 20,
                            height: 20,
                            child: Center(
                                child: SvgPicture.asset(Assets.imagesSetting))),
                      ],
                    ),
                  ),
                ),
              const  SizedBox(
                  height: 12,
                ),
               const FeaturedItemListView(),
               const SizedBox(
                  height: 12,
                ),
              const  BestSellingHeader(),
              const  SizedBox(
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
