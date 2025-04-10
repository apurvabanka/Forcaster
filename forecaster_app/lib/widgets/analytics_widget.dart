import 'package:flutter/material.dart';
import 'package:forecaster_app/widgets/area_ratings.dart';
import 'package:forecaster_app/widgets/average_rating_widget.dart';
import 'package:forecaster_app/widgets/cluster_widget.dart';
import 'package:forecaster_app/widgets/multiple_deliveries.dart';
import 'package:forecaster_app/widgets/vehicles_widget.dart';
import 'package:forecaster_app/widgets/weather_conditions.dart';

class AnalyticsWidget extends StatelessWidget {
  const AnalyticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 4.0,
          child: Column(
            children: [
              const SizedBox(height: 18,),
              const AverageRatingWidget(),
              const SizedBox(height: 18,),
              const ClusterWidget(),
              const SizedBox(height: 18,),
              VehicleEfficiencyApp(),
              const SizedBox(height: 18,),
              WeatherImpactDelivery(),
              const SizedBox(height: 18,),
              TimeBasedDeliveries(),
              const SizedBox(height: 18,),
              const AreaRatingsComparison(),
              const SizedBox(height: 18,),
            ],
          ),
        ),
      ),
    );
  }
}