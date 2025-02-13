import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/checkout/presentation/view/widgets/order_price_widget.dart';
import 'package:e_commerce_app/features/checkout/presentation/view/widgets/show_address_widget.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({
    super.key, required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        const Text(
          'ملخص الطلب :',
          style: Styles.bold13,
        ),
        const SizedBox(
          height: 8,
        ),
        Center(
          child: OrderPriceWidget(),
        ),
        const SizedBox(
          height: 16,
        ),
         Center(
          child: ShowAddressWidget( pageController:  pageController,),
        )
      ],
    );
  }
}
