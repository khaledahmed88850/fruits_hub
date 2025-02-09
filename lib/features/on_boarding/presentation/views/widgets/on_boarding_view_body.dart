import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(
      () {
        currentPage = pageController.page!.round();
        setState(() {});
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: OnBoardingPageView(
          pageController: pageController,
        )),
        DotsIndicator(
          dotsCount: 2,
          position: 0,
          decorator: DotsDecorator(
              activeColor: kPrimaryColor,
              color: currentPage == 1
                  ? kPrimaryColor
                  : kPrimaryColor.withValues(alpha:0.5),),
        ),
        const SizedBox(
          height: 29,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Visibility(
            visible: currentPage == 1 ? true : false,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: CustomButton(
              text: 'ابدأ الان',
              onPressed: () {
                Prefs.setBool(kIsOnBoardingViewSeen, true);
                Navigator.pushReplacementNamed(context, LoginView.routeName);
              },
            ),
          ),
        ),
        const SizedBox(
          height: 43,
        )
      ],
    );
  }
}
