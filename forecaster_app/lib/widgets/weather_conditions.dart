import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';



class WeatherImpactDelivery extends StatefulWidget {
  @override
  _WeatherImpactDeliveryState createState() => _WeatherImpactDeliveryState();
}

class _WeatherImpactDeliveryState extends State<WeatherImpactDelivery> {
  // Weather data: Average Delivery Time (in mins) for each condition
  final Map<String, double> weatherData = {
    "Clear": 20,
    "Rainy": 30,
    "Snowy": 50,
  };

  // Scatter plot data: Random delivery times for each condition
  final List<ScatterPlotData> scatterData = [
    ScatterPlotData("Clear", 15),
    ScatterPlotData("Clear", 20),
    ScatterPlotData("Clear", 22),
    ScatterPlotData("Rainy", 25),
    ScatterPlotData("Rainy", 35),
    ScatterPlotData("Snowy", 40),
    ScatterPlotData("Snowy", 55),
  ];

  String selectedWeather = "Clear";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weather Slider
            Text("Select Weather Condition", style: TextStyle(fontSize: 18)),
            Slider(
              value: weatherData[selectedWeather]!,
              min: 20,
              max: 50,
              divisions: 2,
              label: selectedWeather,
              onChanged: (value) {
                setState(() {
                  if (value <= 25) {
                    selectedWeather = "Clear";
                  } else if (value <= 40) {
                    selectedWeather = "Rainy";
                  } else {
                    selectedWeather = "Snowy";
                  }
                });
              },
            ),

            SizedBox(height: 20),

            // Dynamic Text Display
            Text(
              "Average Delivery Time: ${weatherData[selectedWeather]} mins",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            // Scatter Plot
            Expanded(
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: "Delivery Times by Weather Condition"),
                series: <ChartSeries>[
                  ScatterSeries<ScatterPlotData, String>(
                    dataSource: scatterData
                        .where((data) => data.weather == selectedWeather)
                        .toList(),
                    xValueMapper: (ScatterPlotData data, _) => data.weather,
                    yValueMapper: (ScatterPlotData data, _) => data.time,
                    markerSettings: MarkerSettings(isVisible: true),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Scatter Plot Data Class
class ScatterPlotData {
  final String weather;
  final double time;

  ScatterPlotData(this.weather, this.time);
}
