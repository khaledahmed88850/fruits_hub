import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entities/order_entity.dart';

class OrderPriceWidget extends StatelessWidget {
  const OrderPriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: ShapeDecoration(
          color: const Color(0xffF2F3F3).withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          )),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style:
                    Styles.regular13.copyWith(color: const Color(0xff4E5556)),
              ),
              const Spacer(),
              Text(
                ' ${context.read<OrderEntity>().cartEntity.calculateCheckout()} جنيه',
                style: Styles.semiBold16,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                'التوصيل :',
                style:
                    Styles.regular13.copyWith(color: const Color(0xff4E5556)),
              ),
              const Spacer(),
              Text(
                '30 جنيه',
                style:
                    Styles.semiBold13.copyWith(color: const Color(0xff4E5556)),
              ),
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Divider(
              thickness: .5,
              color: Color(0xffCACECE),
            ),
          ),
          Row(
            children: [
              const Text(
                'الكلي',
                style: Styles.bold16,
              ),
              const Spacer(),
              Text(
                ' ${context.read<OrderEntity>().cartEntity.calculateCheckout() + 30} جنيه',
                style: Styles.bold16,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
