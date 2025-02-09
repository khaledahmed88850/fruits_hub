
import 'package:e_commerce_app/features/home/domain/entities/navigation_bar_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.navigationBarEntity});
  final NavigationBarEntity navigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      color: Colors.transparent,
      child: SvgPicture.asset(navigationBarEntity.inActiveImage));
  }
}