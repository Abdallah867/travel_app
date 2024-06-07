import 'package:flutter/material.dart';
import '../../../../../core/constants/app_constants.dart';

import 'profile_menu.dart';

class ProfileMenusListView extends StatelessWidget {
  static const menus = AppConstants.menuItems;

  const ProfileMenusListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: menus.length,
      itemBuilder: (context, index) {
        return ProfileMenu(
          name: menus[index].name,
          icon: menus[index].icon,
          path: menus[index].path,
        );
      },
    );
  }
}
