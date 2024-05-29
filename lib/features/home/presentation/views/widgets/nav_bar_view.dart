import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../profile/presentation/view/profile_view.dart';
import '../saved_trips_view.dart';
import 'main_view.dart';

final PersistentTabController _controller =
    PersistentTabController(initialIndex: 0);

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PersistentTabView(
          context,
          bottomScreenMargin: 0,
          controller: _controller,
          decoration: const NavBarDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          margin: EdgeInsets.only(left: 41.w, right: 41.w, bottom: 30.h),
          screens: _buildScreens(),
          items: _navBarsItems(),

          navBarHeight: 70.0.h,
          backgroundColor: AppColors.secondaryColor, // Default is Colors.white.
          navBarStyle: NavBarStyle
              .style6, // Choose the nav bar style with this property.
        ),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const MainView(),
    const ProfileView(),
    const SavedTripsView(),
    const ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    navBarIcon(Icons.home),
    navBarIcon(Icons.search),
    navBarIcon(Icons.groups),
    navBarIcon(Icons.account_circle_sharp),
  ];
}

PersistentBottomNavBarItem navBarIcon(IconData icon) {
  return PersistentBottomNavBarItem(
    inactiveIcon: Icon(
      icon,
      size: 22,
      color: AppColors.whiteColor,
    ),
    icon: Container(
      // alignment: Alignment.center,
      height: 32,
      width: 32,
      decoration: const BoxDecoration(
          color: AppColors.secondaryColor, shape: BoxShape.circle),
      child: Icon(
        icon,
        size: 20,
        color: AppColors.whiteColor,
      ),
    ),
    activeColorPrimary: AppColors.secondaryColor,
  );
}
