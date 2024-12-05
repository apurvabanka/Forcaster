import 'package:flutter/material.dart';
import 'package:forecaster_app/const/constant.dart';
import 'package:forecaster_app/widgets/analytics_widget.dart';
import 'package:forecaster_app/widgets/dashboard_widget.dart';
import 'package:forecaster_app/widgets/side_menu_widget.dart';
import 'package:forecaster_app/widgets/restaurant_widget.dart';
import 'package:forecaster_app/widgets/pred_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widget = [
    const DashboardWidget(),
    const AnalyticsWidget(),
    const RestaurantWidget(), // TODO: Add different widget and replace in this list
    const PredictionWidget(),
    const DashboardWidget(),
    const DashboardWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                child: SideMenuWidget(
                  selectedIndex: _selectedIndex,
                  onItemTapped: _onItemTapped,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: _widget[_selectedIndex],
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: cardBackgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
