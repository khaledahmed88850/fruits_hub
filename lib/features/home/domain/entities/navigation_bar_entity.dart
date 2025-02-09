import 'package:e_commerce_app/core/utils/assets.dart';

class NavigationBarEntity {
  final String title;
  final String activeImage;
  final String inActiveImage;

  NavigationBarEntity(
      {required this.title,
      required this.activeImage,
      required this.inActiveImage});

}

  List<NavigationBarEntity> get navigationBarList => [
    NavigationBarEntity(
      title: 'الرئيسية',
      activeImage: Assets.imagesHomeBold,
      inActiveImage: Assets.imagesHomeOutlined,
    ),
    NavigationBarEntity(
      title: 'المنتجات',
      activeImage: Assets.imagesItemsBold,
      inActiveImage: Assets.imagesItemsOutlined,
    ),
    NavigationBarEntity(
      title: 'سلة التسوق',
      activeImage: Assets.imagesShoppingCartBold,
      inActiveImage: Assets.imagesShoppingCartOutlined,
    ),
    NavigationBarEntity(
      title: 'حسابي',
      activeImage: Assets.imagesUserBold,
      inActiveImage: Assets.imagesUserOutlined,
    ),
  ];