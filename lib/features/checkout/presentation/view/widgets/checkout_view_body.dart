import 'dart:developer';

import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/helper_functions/build_error.dart';
import 'package:e_commerce_app/core/utils/api_keys.dart';
import 'package:e_commerce_app/core/widgets/custom_appbar.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/checkout/data/models/payment/amount.dart';
import 'package:e_commerce_app/features/checkout/data/models/payment/details.dart';
import 'package:e_commerce_app/features/checkout/data/models/payment/item.dart';
import 'package:e_commerce_app/features/checkout/data/models/payment/item_list.dart';
import 'package:e_commerce_app/features/checkout/data/models/payment/payment_model.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/manager/cubits/order_cubit/order_cubit.dart';
import 'package:e_commerce_app/features/checkout/presentation/view/widgets/steps_controller.dart';
import 'package:e_commerce_app/features/checkout/presentation/view/widgets/steps_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});
  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  int currentPage = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var order = context.read<OrderEntity>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            customAppBar(
                onBackPressed: () {
                  if (currentPage == 0) {
                    Navigator.pop(context);
                  } else {
                    pageController.previousPage(
                        duration: const Duration(milliseconds: 30),
                        curve: Curves.bounceOut);
                  }
                },
                context: context,
                title: getSteps()[currentPage]),
            const SizedBox(height: 16),
            StepsController(
                pageController: pageController, currentPage: currentPage),
            StepsPageView(pageController: pageController),
            const SizedBox(height: 24),
            CustomButton(
                text: currentPage == 2 ? 'تأكيد الطلب' : 'التالي',
                onPressed: () {
                  if (currentPage == 0) {
                    shippingStepHandler(context);
                  } else if (currentPage == 1) {
                    addressStepHandler();
                  } else if (currentPage == 2) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => PaypalCheckoutView(
                        sandboxMode: true,
                        clientId: ApiKeys.clientId,
                        secretKey: ApiKeys.secretKey,
                        transactions: [paymentModelTransactions(order)],
                        note: "Contact us for any questions on your order.",
                        onSuccess: (Map params) async {
                          log("onSuccess: $params");
                          Navigator.pop(context);
                        },
                        onError: (error) {
                          log("onError: $error");
                          Navigator.pop(context);
                        },
                        onCancel: () {
                          log('cancelled:');
                          Navigator.pop(context);
                        },
                      ),
                    ));
                    context.read<OrderCubit>().addOrder(
                          order: context.read<OrderEntity>(),
                        );
                  }
                }),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> paymentModelTransactions(OrderEntity order) {
    return PaymentModel(
      amount: Amount(
        total: order.cartEntity.calculateCheckout().toString(),
        currency: "USD",
        details: Details(
          subtotal: order.cartEntity.calculateCheckout().toString(),
          shipping: "0",
          shippingDiscount: 0,
        ),
      ),
      description: "The payment transaction description.",
      itemList: ItemList(
        items: order.cartEntity.cartEntityList
            .map((e) => Item(
                name: e.productEntity.name,
                quantity: e.count,
                price: e.totalPrice().toString(),
                currency: "USD"))
            .toList(),
      ),
    ).toJson();
  }

  void addressStepHandler() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.animateToPage(currentPage + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
        return;
      });
    }
  }

  shippingStepHandler(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash == null) {
      buildError(context, 'اختر طريقة الدفع', color: Colors.black87);
    } else {
      pageController.animateToPage(currentPage + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
