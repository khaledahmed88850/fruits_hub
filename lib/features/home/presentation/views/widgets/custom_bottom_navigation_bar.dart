import 'dart:core';
import 'package:e_commerce_app/features/home/domain/entities/navigation_bar_entity.dart';
import 'package:flutter/material.dart';

import 'navigation_bar_items.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              offset: Offset(0, -2),
              blurRadius: 25,
            ),
          ]),
      child: Row(
          children: navigationBarList.asMap().entries.map((entry) {
        int index = entry.key;
        var entity = entry.value;
        return Expanded(
          flex: index == selectedIndex ? 2 : 1,
          child: GestureDetector(
            onTap: () {
              selectedIndex = index;
              widget.onItemTapped(index);
              setState(() {});
            },
            child: NavigationBarItems(
              isActive: index == selectedIndex,
              navigationBarEntity: entity,
            ),
          ),
        );
      }).toList()),
    );
  }
}
