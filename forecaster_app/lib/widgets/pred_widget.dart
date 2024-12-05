import 'dart:math';
import 'package:flutter/material.dart';

class PredictionWidget extends StatefulWidget {
  const PredictionWidget({super.key});

  @override
  State<PredictionWidget> createState() => PredictionWidgetState();
}

class PredictionWidgetState extends State<PredictionWidget> {
  // Dropdown values
  String? _selectedCategory;
  String? _selectedOrderType;
  String? _selectedMultipleDeliveries;
  String? _selectedCity;

  // Prediction values
  String _predictedDeliveryTime = "N/A";
  String _predictedPreparationTime = "N/A";

  // Dropdown options
  final List<String> categories = ['Morning', 'Afternoon', 'Evening', 'Night'];
  final List<String> orderTypes = [
    'Snacks',
    'Drinks',
    'Meal',
    'Buffet',
    'Other'
  ];
  final List<String> multipleDeliveriesOptions = ['Yes', 'No'];
  final List<String> cities = ['Urban', 'Metropolitan', 'Other'];

  // Lists of predefined delivery and preparation times
  final List<int> deliveryTimes = [20, 22, 24, 25, 26, 28, 29, 32, 35, 40];
  final List<int> preparationTimes = [15, 18, 20, 25, 30];

  // Function to calculate predictions
  void _predictTimes() {
    if (_selectedCategory != null &&
        _selectedOrderType != null &&
        _selectedMultipleDeliveries != null &&
        _selectedCity != null) {
      if (_predictedDeliveryTime != "N/A" &&
          _predictedPreparationTime != "N/A") {
        // If already submitted, clear the selections
        setState(() {
          _selectedCategory = null;
          _selectedOrderType = null;
          _selectedMultipleDeliveries = null;
          _selectedCity = null;
          _predictedDeliveryTime = "N/A";
          _predictedPreparationTime = "N/A";
        });
      } else {
        // Generate random predictions
        final random = Random();
        setState(() {
          _predictedDeliveryTime =
              "${deliveryTimes[random.nextInt(deliveryTimes.length)]} min";
          _predictedPreparationTime =
              "${preparationTimes[random.nextInt(preparationTimes.length)]} min";
        });
      }
    } else {
      setState(() {
        _predictedDeliveryTime = "N/A";
        _predictedPreparationTime = "N/A";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: "Select Category of the Day",
              border: OutlineInputBorder(),
            ),
            value: _selectedCategory,
            items: categories
                .map((category) =>
                    DropdownMenuItem(value: category, child: Text(category)))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedCategory = value;
              });
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: "Select Type of Order",
              border: OutlineInputBorder(),
            ),
            value: _selectedOrderType,
            items: orderTypes
                .map((orderType) =>
                    DropdownMenuItem(value: orderType, child: Text(orderType)))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedOrderType = value;
              });
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: "Multiple Deliveries?",
              border: OutlineInputBorder(),
            ),
            value: _selectedMultipleDeliveries,
            items: multipleDeliveriesOptions
                .map((option) =>
                    DropdownMenuItem(value: option, child: Text(option)))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedMultipleDeliveries = value;
              });
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: "Select City",
              border: OutlineInputBorder(),
            ),
            value: _selectedCity,
            items: cities
                .map((city) => DropdownMenuItem(value: city, child: Text(city)))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedCity = value;
              });
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _predictTimes,
            child: Text(
              _predictedDeliveryTime != "N/A" &&
                      _predictedPreparationTime != "N/A"
                  ? "Submit"
                  : "Submit",
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Predicted Delivery Time: $_predictedDeliveryTime",
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            "Predicted Preparation Time: $_predictedPreparationTime",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
