import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

import 'featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: width,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(children: [
            Positioned(
              left: 0,
              bottom: 0,
              top: 0,
              right: width * 0.4,
              child: Image.asset(
                Assets.imagesWatermelonTest,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: width * .5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: svg.Svg(
                      Assets.imagesCardBackground,
                    ),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'عروض العيد',
                      style: Styles.regular13.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'خصم 25%',
                      style: Styles.bold19.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    FeaturedItemButton(
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 29,
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
