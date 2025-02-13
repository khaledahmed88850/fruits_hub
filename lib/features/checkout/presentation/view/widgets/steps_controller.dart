import 'package:e_commerce_app/features/checkout/presentation/view/widgets/selected_step.dart';
import 'package:flutter/material.dart';

import 'unselected_step.dart';

class StepsController extends StatelessWidget {
  const StepsController({
    super.key,
    required this.currentPage,
    required this.pageController,
  });
  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
          getSteps().length,
          (index) => index <= currentPage
              ? Expanded(
                  child: GestureDetector(
                      onTap: () {
                        pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                      child: SelectedStep(title: getSteps()[index])))
              : Expanded(
                  child: UnselectedStep(
                    title: getSteps()[index],
                    index: (index + 1).toString(),
                  ),
                )),
    );
  }
}

List<String> getSteps() => ['الشحن', 'العنوان', 'الدفع',];
