import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/manager/cubits/order_cubit/order_cubit.dart';
import 'package:e_commerce_app/features/checkout/presentation/view/widgets/steps_controller.dart';
import 'package:e_commerce_app/features/checkout/presentation/view/widgets/steps_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_appbar.dart';

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

  void shippingStepHandler(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash == null) {
      return;
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
