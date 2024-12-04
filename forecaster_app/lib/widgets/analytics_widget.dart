import 'package:flutter/material.dart';
import 'package:forecaster_app/widgets/average_rating_widget.dart';
import 'package:forecaster_app/widgets/cluster_widget.dart';
import 'package:forecaster_app/widgets/headerWidget.dart';

class AnalyticsWidget extends StatelessWidget {
  const AnalyticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(height: 18,),
          Headerwidget(),
          SizedBox(height: 18,),
          AverageRatingWidget(),
          SizedBox(height: 18,),
          ClusterWidget(),
          SizedBox(height: 200,),
        ],
      ),
    );
  }
}