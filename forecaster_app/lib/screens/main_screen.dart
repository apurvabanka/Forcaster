import 'package:flutter/material.dart';
import 'package:forecaster_app/const/constant.dart';
import 'package:forecaster_app/widgets/dashboard_widget.dart';
import 'package:forecaster_app/widgets/side_menu_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(
                child: SideMenuWidget(),
              ),
            ),
            const Expanded(
              flex: 7,
              child: DashboardWidget(),
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
