import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/widgets/page_view_items.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItems(
            isVisible: true,
            image: Assets.imagesPageViewItemImage1,
            backgroundImage: Assets.imagesPageViewItemBackgroundImage1,
            subTitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'مرحبًا بك في',
                  style: Styles.bold23,
                ),
                Text(
                  ' HUB',
                  style: Styles.bold23.copyWith(
                    color: const Color(0xffF4A91F),
                  ),
                ),
                Text(
                  'Fruit',
                  style: Styles.bold23.copyWith(
                    color: kPrimaryColor,
                  ),
                ),
              ],
            )),
        const PageViewItems(
            isVisible: false,
            image: Assets.imagesPageViewItemImage2,
            backgroundImage: Assets.imagesPageViewItemBackgroundImage2,
            subTitle:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            title: Text('ابحث وتسوق', style: Styles.bold23)),
      ],
    );
  }
}
