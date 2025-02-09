import 'package:flutter/material.dart';

import 'featured_item.dart';

class FeaturedItemListView extends StatelessWidget {
  const FeaturedItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: 
          List.generate(4, (index) {
            return const  Padding(
              padding:  EdgeInsets.only(left: 8),
              child:  FeaturedItem(),
            );
          }, )
      ),
    );
  }
}