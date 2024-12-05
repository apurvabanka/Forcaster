import 'package:flutter/material.dart';
import 'package:forecaster_app/widgets/restaurant_activity_details.dart';
import 'package:forecaster_app/widgets/bar_graph_card2.dart';
import 'package:forecaster_app/widgets/headerWidget.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 18),
          Headerwidget(),
          SizedBox(height: 18),
          RestaurantDetailsCard(),
          SizedBox(height: 18),
          BarGraphCard(),
          SizedBox(height: 18),
          // Removed Dropdowns and Prediction Logic
          SizedBox(height: 100),
        ],
      ),
    );
  }

  // Sample data for the graph
  List<FlSpot> _getHourlyDeliverySpots() {
    final data = {
      0: 22.0,
      1: 21.0,
      2: 20.0,
      3: 20.0,
      4: 19.5,
      5: 19.0,
      6: 19.0,
      7: 20.0,
      8: 22.0,
      9: 25.0,
      10: 28.0,
      11: 30.0,
      12: 29.0,
      13: 28.0,
      14: 27.5,
      15: 27.0,
      16: 27.0,
      17: 28.5,
      18: 30.0,
      19: 31.0,
      20: 30.0,
      21: 28.0,
      22: 25.0,
      23: 23.0,
    };

    return data.entries
        .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
        .toList();
  }
}
