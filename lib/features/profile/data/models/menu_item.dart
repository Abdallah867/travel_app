import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final IconData icon;
  final VoidCallback onTap;

  const MenuItem({required this.name, required this.icon, required this.onTap});
}
