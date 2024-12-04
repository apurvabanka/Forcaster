import 'package:flutter/material.dart';
import 'package:forecaster_app/const/constant.dart';

class AverageRatingWidget extends StatefulWidget {
  const AverageRatingWidget({super.key});

  @override
  State<AverageRatingWidget> createState() => _AverageRatingWidgetState();
}

class _AverageRatingWidgetState extends State<AverageRatingWidget> {
  double _rating = 4.3;

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
                'Distance',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Slider(
                value: _rating,
                min: 1.0,
                max: 5.0,
                divisions: 40,
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
                onChanged: (value) {
                  setState(() {
                    _rating = double.parse(value.toStringAsFixed(1));
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
