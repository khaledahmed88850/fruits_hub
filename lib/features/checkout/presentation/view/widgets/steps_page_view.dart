import 'package:e_commerce_app/features/checkout/presentation/view/widgets/address_page.dart';
import 'package:e_commerce_app/features/checkout/presentation/view/widgets/payment_page.dart';
import 'package:e_commerce_app/features/checkout/presentation/view/widgets/shipping_page.dart';
import 'package:flutter/material.dart';

class StepsPageView extends StatelessWidget {
  const StepsPageView({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: getPages().length,
        itemBuilder: (context, index) {
          return getPages()[index];
        },
      ),
    );
  }

  List<Widget> getPages() => [
        ShippingPage(),
        AddressPage(),
        PaymentPage(
          pageController: pageController,
        ),
      ];
}
