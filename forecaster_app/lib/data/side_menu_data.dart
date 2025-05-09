import 'package:flutter/material.dart';
import 'package:forecaster_app/models/menu_model.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: 'Dashboard'),
    MenuModel(icon: Icons.analytics, title: 'Analytics'),
    MenuModel(icon: Icons.analytics, title: 'Restaurant'),
    MenuModel(icon: Icons.person, title: 'Predictor'),
  ];
}
