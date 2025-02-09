import 'package:e_commerce_app/features/home/presentation/views/cart_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/home_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/products_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'MainView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> screens = [
    const HomeView(),
    const ProductsView(),
    const CartView(),
    const Center(
      child: Text('Profile'),
    ),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (value) {
          currentIndex = value;
          setState(() {});
        },
      ),
      body: SafeArea(
          child: IndexedStack(
        index: currentIndex,
        children: screens,
      )),
    );
  }
}
