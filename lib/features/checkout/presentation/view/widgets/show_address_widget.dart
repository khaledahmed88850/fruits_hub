import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets.dart';

class ShowAddressWidget extends StatelessWidget {
  const ShowAddressWidget({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      decoration: ShapeDecoration(
          color: const Color(0xffF2F3F3).withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          )),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'عنوان التوصيل',
                style: Styles.bold13,
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceOut);
                  },
                  child: SvgPicture.asset(Assets.imagesEdit)),
              const SizedBox(
                width: 6,
              ),
              Text(
                'تعديل',
                style:
                    Styles.semiBold13.copyWith(color: const Color(0xff949D9E)),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              SvgPicture.asset(Assets.imagesLocation),
              const SizedBox(
                width: 8,
              ),
              Text(
                "${context.read<OrderEntity>().addressEntity.city} - ${context.read<OrderEntity>().addressEntity.address} - ${context.read<OrderEntity>().addressEntity.addressDetails}",
                style:
                    Styles.regular16.copyWith(color: const Color(0xff4E5556)),
              )
            ],
          )
        ],
      ),
    );
  }
}
