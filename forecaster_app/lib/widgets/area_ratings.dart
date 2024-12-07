import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AreaRatingsComparison extends StatefulWidget {
  const AreaRatingsComparison({super.key});

  @override
  _AreaRatingsComparisonState createState() => _AreaRatingsComparisonState();
}

class _AreaRatingsComparisonState extends State<AreaRatingsComparison> {
  // Ratings data: Average ratings for Urban and Suburban areas
  final Map<String, double> ratingsData = {
    "Urban": 3.5,
    "Suburban": 4.2,
  };

  String selectedArea = "Urban";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      //appBar: AppBar(
        //title: Text("Urban vs. Suburban Ratings"),
      //),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Area Selector
            Text("Select Area Type", style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedArea,
              onChanged: (String? newValue) {
                setState(() {
                  selectedArea = newValue!;
                });
              },
              items: ratingsData.keys.map<DropdownMenuItem<String>>((String area) {
                return DropdownMenuItem<String>(
                  value: area,
                  child: Text(area),
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            // Dynamic Average Rating Display
            Text(
              "Average Rating: ${ratingsData[selectedArea]!.toStringAsFixed(1)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Side-by-Side Bar Chart
            Expanded(
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: "Ratings Comparison: Urban vs. Suburban"),
                legend: Legend(isVisible: true),
                series: <ChartSeries>[
                  ColumnSeries<MapEntry<String, double>, String>(
                    dataSource: ratingsData.entries.toList(),
                    xValueMapper: (data, _) => data.key,
                    yValueMapper: (data, _) => data.value,
                    name: "Average Ratings",
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    color: Colors.blue,
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
