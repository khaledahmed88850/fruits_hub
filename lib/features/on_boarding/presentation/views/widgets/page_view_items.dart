import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewItems extends StatelessWidget {
  const PageViewItems(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitle,
      required this.title, required this.isVisible});
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
                visible: isVisible ,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text('تخط'),
                ),
              ),
            ],
          ),
        ),
     const  SizedBox(height: 64,),
        title,
        const SizedBox(height: 24,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(subTitle , textAlign: TextAlign.center,),
        ),
      ],
    );
  }
}
