import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class VehicleEfficiencyApp extends StatefulWidget {
  @override
  _VehicleEfficiencyAppState createState() => _VehicleEfficiencyAppState();
}

class _VehicleEfficiencyAppState extends State<VehicleEfficiencyApp> {
  // Vehicle data: Average deliveries and efficiency score
  final Map<String, Map<String, double>> vehicleData = {
    "Motorcycle": {"averageDeliveries": 30, "efficiencyScore": 85},
    "Bicycle": {"averageDeliveries": 8, "efficiencyScore": 60},
    "Scooter": {"averageDeliveries": 18, "efficiencyScore": 75},
    "Electric Scooter": {"averageDeliveries": 12, "efficiencyScore": 50},
  };

  String selectedVehicle = "Motorcycle";

  @override
  Widget build(BuildContext context) {
    return Container(
      //appBar: AppBar(title: Text("Vehicle Efficiency")),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown Selector
            Text("Select Vehicle Type", style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: selectedVehicle,
              onChanged: (String? newValue) {
                setState(() {
                  selectedVehicle = newValue!;
                });
              },
              items: vehicleData.keys.map<DropdownMenuItem<String>>((String vehicle) {
                return DropdownMenuItem<String>(
                  value: vehicle,
                  child: Text(vehicle),
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            // Average Deliveries Display
            Text(
              "Average Deliveries: ${vehicleData[selectedVehicle]!["averageDeliveries"]!.toStringAsFixed(0)}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            // Efficiency Score Display using Radial Gauge
            Text("Efficiency Score", style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 200,
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    ranges: [
                      GaugeRange(startValue: 0, endValue: 50, color: Colors.red),
                      GaugeRange(startValue: 50, endValue: 75, color: Colors.orange),
                      GaugeRange(startValue: 75, endValue: 100, color: Colors.green),
                    ],
                    pointers: [
                      NeedlePointer(
                        value: vehicleData[selectedVehicle]!["efficiencyScore"]!,
                      ),
                    ],
                    annotations: [
                      GaugeAnnotation(
                        widget: Text(
                          "${vehicleData[selectedVehicle]!["efficiencyScore"]!.toStringAsFixed(0)}%",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
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
