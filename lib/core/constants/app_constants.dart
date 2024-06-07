import 'package:flutter/material.dart';

import '../../features/profile/data/models/menu_item.dart';
import '../routes/app_routes.dart';

class AppConstants {
  static const double designHeight = 915;
  static const double designWidth = 412;
  static const String profilesCollectionEndpoint = 'profiles';
  static const String savesCollectionEndpoint = 'saves';
  static const String tripsCollectionEndpoint = 'trips';
  static const String agenciesCollectionEndpoint = 'agencies';
  static const Map<String, String> appwriteCollections = {
    profilesCollectionEndpoint: '662b840e9331aff1d019',
    savesCollectionEndpoint: '66575dd000095253e61f',
    tripsCollectionEndpoint: '6654b7b100027501e8dc',
    agenciesCollectionEndpoint: '66575ca500179e6a8ee3',
  };

  static const List<MenuItem> menuItems = [
    MenuItem(
        name: 'Profile', icon: Icons.person, path: AppRoutes.kEditProfileView),
    MenuItem(name: 'Bookings', icon: Icons.calendar_month, path: ''),
    MenuItem(name: 'Settings', icon: Icons.settings, path: ''),
    MenuItem(name: 'Notifications', icon: Icons.notification_add, path: ''),
  ];
}
