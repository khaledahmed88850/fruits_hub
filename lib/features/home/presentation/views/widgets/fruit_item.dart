import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/fruit_details/presentation/view/fruit_item_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/cubits/cart_cubit/cart_cubit.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return FruitItemDetailsView(productEntity: productEntity);
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffF3F5F7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            const Positioned(
                right: 8, top: 8, child: Icon(Icons.favorite_border_rounded)),
            Positioned.fill(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Flexible(
                      child: productEntity.imageUrl != null
                          ? CachedNetworkImage(
                              imageUrl: productEntity.imageUrl!,
                              errorWidget: (context, url, error) {
                                return const Icon(Icons.error);
                              },
                              placeholder: (context, url) {
                                return const SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator(
                                      strokeAlign: 5,
                                    ));
                              },
                            )
                          : const SizedBox(
                              height: 100,
                              width: double.infinity,
                            )),
                  const SizedBox(
                    height: 24,
                  ),
                  ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      title: Text(
                        productEntity.name,
                        style: Styles.semiBold13,
                      ),
                      subtitle: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: '${productEntity.price}جنية ',
                            style: Styles.semiBold13.copyWith(
                              color: const Color(0xffF4A91F),
                            ),
                          ),
                          TextSpan(
                            text: '/ الكيلو',
                            style: Styles.semiBold13.copyWith(
                              color: const Color(0xffF8C76D),
                            ),
                          ),
                        ]),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: kDarkPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .addProductToCart(productEntity);
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
