import 'package:flutter/material.dart';
import 'package:forecaster_app/widgets/restaurant_activity_details.dart';
import 'package:forecaster_app/widgets/bar_graph_card.dart';
import 'package:forecaster_app/widgets/headerWidget.dart';
import 'package:forecaster_app/widgets/Restaurant_Line_Data.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          Headerwidget(),
          SizedBox(
            height: 18,
          ),
          RestaurantDetailsCard(),
          SizedBox(
            height: 18,
          ),
          // LineChartCard(),
          // SizedBox(
          //   height: 18,
          // ),
          BarGraphCard(),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
