import 'package:flutter/material.dart';

import '../../features/profile/data/models/menu_item.dart';

class AppConstants {
  static const double designHeight = 915;
  static const double designWidth = 412;
  static const String profilesCollectionEndpoint = 'profiles';
  static const Map<String, String> appwriteCollections = {
    profilesCollectionEndpoint: '662b840e9331aff1d019',
  };

  static const List<MenuItem> menuItems = [
    MenuItem(name: 'Profile', icon: Icons.person),
    MenuItem(name: 'Bookings', icon: Icons.calendar_month),
    MenuItem(name: 'Settings', icon: Icons.settings),
    MenuItem(name: 'Notifications', icon: Icons.notification_add),
  ];
}
