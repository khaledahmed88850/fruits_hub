import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewItems extends StatelessWidget {
  const PageViewItems(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitle,
      required this.title,
      required this.isVisible});
  final String image, backgroundImage;
  final String subTitle;
  final Widget title;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                  child: SvgPicture.asset(
                backgroundImage,
                fit: BoxFit.fill,
              )),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SvgPicture.asset(
                    image,
                  )),
              Visibility(
                visible: isVisible,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: GestureDetector(
                      onTap: () {
                        Prefs.setBool(kIsOnBoardingViewSeen, true);
                        Navigator.of(context)
                            .pushReplacementNamed(LoginView.routeName);
                      },
                      child: Text(
                        'تخط',
                        style: Styles.regular13
                            .copyWith(color: const Color(0xff949D9E)),
                      )),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        title,
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subTitle,
            style: Styles.semiBold13.copyWith(
              color: const Color(0xff4E5556),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
