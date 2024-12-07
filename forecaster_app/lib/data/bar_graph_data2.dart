import 'package:forecaster_app/models/bar_graph_model.dart';
import 'package:forecaster_app/models/graph_model.dart';
import 'package:flutter/material.dart';

class BarGraphData {
  final data = [
    const BarGraphModel(
        label: "Time of day vs Delivery time ",
        color: Color(0xFFFEB95A),
        graph: [
          GraphModel(x: 0, y: 20.2),
          GraphModel(x: 1, y: 25.63),
          GraphModel(x: 2, y: 29.9),
          GraphModel(x: 3, y: 26.66),
        ]),
    const BarGraphModel(
        label: "Order type vs Order Preparation Time",
        color: Color(0xFFF2C8ED),
        graph: [
          GraphModel(x: 0, y: 17),
          GraphModel(x: 1, y: 12.5),
          GraphModel(x: 2, y: 18),
          GraphModel(x: 3, y: 22),
        ]),
    const BarGraphModel(
        label: "Road Traffic vs Delivery time",
        color: Color(0xFF20AEF3),
        graph: [
          GraphModel(x: 0, y: 20.23),
          GraphModel(x: 1, y: 24.6),
          GraphModel(x: 2, y: 34.50),
          GraphModel(x: 3, y: 40.44),
        ]),
  ];

  final labels = [
    ['Morning', 'Afternoon', 'Evening', 'Night'], // Labels for first graph
    ['Buffet', 'Drinks', 'Meal', 'Snacks'], // Labels for second graph
    ['Low', 'Medium', 'High', 'Jam'], // Labels for third graph
  ];
}
