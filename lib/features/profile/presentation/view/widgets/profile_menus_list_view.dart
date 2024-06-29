import 'package:flutter/material.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/menu_item.dart';
import 'profile_menu.dart';

class ProfileMenusListView extends StatelessWidget {
  const ProfileMenusListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuItem> menus = getMenuList(context);
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

List<MenuItem> getMenuList(BuildContext context) {
  return [
    MenuItem(
        name: S.of(context).profile,
        icon: Icons.person,
        path: AppRoutes.kEditProfileView),
    MenuItem(
        name: S.of(context).bookings, icon: Icons.calendar_month, path: ''),
    MenuItem(name: S.of(context).settings, icon: Icons.settings, path: ''),
    MenuItem(
        name: S.of(context).notifications,
        icon: Icons.notification_add,
        path: ''),
  ];
}
