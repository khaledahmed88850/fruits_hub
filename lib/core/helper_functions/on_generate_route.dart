import 'package:e_commerce_app/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce_app/features/checkout/presentation/view/checkout_view.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:e_commerce_app/features/home/presentation/views/main_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/products_result_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/products_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:e_commerce_app/features/search/presentation/view/search_view.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/best_selling/presentation/view/best_selling_view.dart';
import '../../features/home/presentation/views/home_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (_) => const MainView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case SearchView.routeName:
      return MaterialPageRoute(builder: (_) => const SearchView());
    case ProductsResultView.routeName:
      return MaterialPageRoute(builder: (_) => const ProductsResultView());
    case ProductsView.routeName:
      return MaterialPageRoute(builder: (_) => const ProductsView());
    case CheckoutView.routeName:
      return MaterialPageRoute(
          builder: (_) => CheckoutView(
                cartEntity: settings.arguments as CartEntity,
              ));

    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (_) => const BestSellingView());
    default:
      return MaterialPageRoute(builder: (_) => const Placeholder());
  }
}
