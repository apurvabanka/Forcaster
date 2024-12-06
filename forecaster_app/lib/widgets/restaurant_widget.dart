import 'package:flutter/material.dart';
import 'package:forecaster_app/widgets/restaurant_activity_details.dart';
import 'package:forecaster_app/widgets/bar_graph_card2.dart';
import 'package:forecaster_app/widgets/headerWidget.dart';
import 'package:fl_chart/fl_chart.dart';

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const Headerwidget(),
          const SizedBox(height: 12),
          const RestaurantDetailsCard(),
          const SizedBox(height: 12),
          const BarGraphCard(),
          const SizedBox(height: 12),
          // Add the graph in the middle widget
          Text(
            'Average Delivery Time by Hour of the Day',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200, // Graph height
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30, // Reserved space for Y-axis
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(fontSize: 8),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 20, // Reserved space for X-axis
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(fontSize: 8),
                        );
                      },
                    ),
                  ),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: true),
                lineBarsData: [
                  LineChartBarData(
                    spots: _getHourlyDeliverySpots(),
                    isCurved: true,
                    dotData: FlDotData(show: true),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50), // Space below the graph
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
