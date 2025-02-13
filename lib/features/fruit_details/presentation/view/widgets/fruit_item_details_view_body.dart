import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/fruit_details/presentation/view/widgets/fruit_details_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_clip_path.dart';
import '../../../../home/presentation/views/widgets/cart_item_action_button.dart';
import '../../../../home/presentation/views/widgets/rating_widget.dart';

class FruitItemDetailsViewBody extends StatelessWidget {
  const FruitItemDetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Stack(children: [
        ClipPath(
            clipper: CustomClipPath(),
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.55,
                color: const Color(0xffF3F5F7),
                child: CachedNetworkImage(imageUrl: productEntity.imageUrl!))),
        Positioned(
            top: 30,
            right: 20,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                    height: 44,
                    width: 44,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child:
                        const Center(child: Icon(Icons.arrow_back_ios_new))))),
      ]),
      const SizedBox(height: 16),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(productEntity.name, style: Styles.semiBold16),
              const SizedBox(height: 4),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: '${productEntity.price} جنية',
                    style: Styles.semiBold13
                        .copyWith(color: const Color(0xffF4A91F))),
                TextSpan(
                    text: '/ الكيلو',
                    style: Styles.semiBold13
                        .copyWith(color: const Color(0xffF8C76D)))
              ]))
            ]),
            const Spacer(),
            CartItemActionButton(
                onTap: () {
                  context.read<CartCubit>().addProductToCart(productEntity);
                },
                icon: Icons.add,
                iconColor: Colors.white,
                backgroundColor: kDarkPrimaryColor),
            const SizedBox(width: 16),
            Text(context.watch<CartCubit>().getCount(productEntity).toString(),
                style: Styles.bold16),
            const SizedBox(width: 16),
            CartItemActionButton(
                onTap: () {
                  context
                      .read<CartCubit>()
                      .decreaseProductAmountFromCart(productEntity);
                },
                backgroundColor: const Color(0xffF3F5F7),
                icon: Icons.remove,
                iconColor: const Color(0xff979899))
          ])),
      const SizedBox(height: 8),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: RatingWidget(productEntity: productEntity)),
      const SizedBox(height: 8),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(productEntity.description,
              style:
                  Styles.regular13.copyWith(color: const Color(0xff979899)))),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
              width: double.infinity,
              child: FruitDetailsGridView(productEntity: productEntity))),
      const SizedBox(height: 24),
    ]));
  }
}
