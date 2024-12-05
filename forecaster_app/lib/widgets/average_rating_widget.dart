import 'package:flutter/material.dart';
import 'package:forecaster_app/const/constant.dart';
import 'package:forecaster_app/controller/average_rating_controller.dart';
import 'package:get/instance_manager.dart';

class AverageRatingWidget extends StatefulWidget {
  const AverageRatingWidget({super.key});

  @override
  State<AverageRatingWidget> createState() => _AverageRatingWidgetState();
}

class _AverageRatingWidgetState extends State<AverageRatingWidget> {
  final AverageRatingController controller = Get.put(AverageRatingController());
  double _rating = 3.0;
  double _sliderValue = 10;

  void run() {
    controller.fetchData(_rating);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: cardBackgroundColor,
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Time Taken (min)',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              Text(
                _sliderValue.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 32),
              ),
              Slider(
                value: _sliderValue,
                min: 10.0,
                max: 55.0,
                divisions: 40,
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                    controller.fetchData(value);
                    _rating =
                        double.parse(controller.y_pred.toStringAsFixed(1));
                  });
                },
              ),
              const SizedBox(height: 20),
              Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _rating.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.star,
                      color: Colors.blue,
                      size: 32,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Average Rating',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
