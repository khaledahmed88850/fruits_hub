import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/view/widgets/shipping_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingPage extends StatefulWidget {
  const ShippingPage({
    super.key,
  });

  @override
  State<ShippingPage> createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage>
    with AutomaticKeepAliveClientMixin {
  int index = -1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        ShippingMethod(
          onTap: () {
            index = 0;
            context.read<OrderEntity>().payWithCash = true;
            setState(() {});
          },
          isSelected: index == 0,
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price:
              ' ${context.read<OrderEntity>().cartEntity.calculateCheckout()} جنيه',
        ),
        const SizedBox(
          height: 8,
        ),
        ShippingMethod(
            onTap: () {
              index = 1;
              context.read<OrderEntity>().payWithCash = false;
              setState(() {});
            },
            isSelected: index == 1,
            title: 'اشتري الان وادفع لاحقا',
            subtitle: 'يرجي تحديد طريقه الدفع',
            price: 'مجاني'),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
