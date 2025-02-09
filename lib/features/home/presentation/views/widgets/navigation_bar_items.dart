
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/navigation_bar_entity.dart';
import 'active_item.dart';
import 'inactive_item.dart';

class NavigationBarItems extends StatelessWidget {
  const NavigationBarItems(
      {super.key, required this.isActive, required this.navigationBarEntity});
  final bool isActive;
  final NavigationBarEntity navigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveItem(
            navigationBarEntity: navigationBarEntity,
          )
        : InActiveItem(
            navigationBarEntity: navigationBarEntity,
          );
  }
}
