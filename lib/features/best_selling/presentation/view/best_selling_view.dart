import 'package:e_commerce_app/core/widgets/custom_appbar.dart';
import 'package:e_commerce_app/features/best_selling/presentation/view/widgets/best_selling_view_body.dart';
import 'package:flutter/material.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const routeName = 'best-selling';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        onBackPressed: () {
          
        },
          context: context,
          title: 'الأكثر مبيعًا',
          notificationsActivated: true),
      body: const BestSellingViewBody(),
    );
  }
}
