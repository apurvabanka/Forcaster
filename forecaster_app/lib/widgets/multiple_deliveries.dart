import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TimeBasedDeliveries extends StatefulWidget {
  const TimeBasedDeliveries({super.key});

  @override
  _TimeBasedDeliveriesState createState() => _TimeBasedDeliveriesState();
}

class _TimeBasedDeliveriesState extends State<TimeBasedDeliveries> {
  // Delivery data: number of deliveries for each time period
  final Map<String, int> deliveryData = {
    "Morning": 20,
    "Afternoon": 35,
    "Evening": 50,
  };

  String selectedTime = "Morning";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time Selector
            const Text("Select Time of Day", style: TextStyle(fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTimeButton("Morning"),
                _buildTimeButton("Afternoon"),
                _buildTimeButton("Evening"),
              ],
            ),
            const SizedBox(height: 20),
            // Dynamic Text Display
            Text(
              "Deliveries: ${deliveryData[selectedTime]}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Dynamic Bar Chart
            Expanded(
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: "Deliveries by Time of Day"),
                series: <ChartSeries>[
                  ColumnSeries<MapEntry<String, int>, String>(
                    dataSource: deliveryData.entries.toList(),
                    xValueMapper: (data, _) => data.key,
                    yValueMapper: (data, _) => data.value,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    color: Colors.blue,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeButton(String time) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedTime = time;
        });
      },
      child: Text(time),
    );
  }
}
