
import 'package:e_commerce_app/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = 'Splash';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody()
    );
  }
}