import 'package:e_commerce_app/core/helper_functions/indexed_stack_provider.dart';
import 'package:e_commerce_app/features/home/presentation/views/cart_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/home_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/products_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  List<Widget> screens = [
    const HomeView(),
    const ProductsView(),
    const CartView(),
    const Center(
      child: Text('Profile'),
    ),
  ];

  
  @override
  Widget build(BuildContext context) {
    final indexStack = Provider.of<IndexStackProvider>(context);
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (value) {
          
          indexStack.setIndex(value);
          setState(() {});
        },
      ),
      body: SafeArea(
          child: IndexedStack(
        index: indexStack.currentIndex,
        children: screens,
      )),
    );
  }
}
