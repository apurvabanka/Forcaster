import 'package:flutter/material.dart';
import 'package:forecaster_app/widgets/activity_details_card.dart';
import 'package:forecaster_app/widgets/bar_graph_card.dart';
import 'package:forecaster_app/widgets/headerWidget.dart';
import 'package:forecaster_app/widgets/line_chart_card.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1.1,
          child: const Column(
            children: [
              SizedBox(
                height: 18,
              ),
              Headerwidget(),
              SizedBox(
                height: 18,
              ),
              ActivityDetailsCard(),
              SizedBox(
                height: 18,
              ),
              LineChartCard(),
              SizedBox(
                height: 18,
              ),
              BarGraphCard(),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
=======
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          Headerwidget(),
          SizedBox(
            height: 18,
          ),
          ActivityDetailsCard(),
          SizedBox(
            height: 18,
          ),
          LineChartCard(),
          SizedBox(
            height: 18,
          ),
          BarGraphCard(),
          SizedBox(
            height: 100,
          ),
        ],
>>>>>>> Stashed changes
      ),
    );
  }
}
