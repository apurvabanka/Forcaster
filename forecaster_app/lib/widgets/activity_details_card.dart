import 'package:flutter/material.dart';
import 'package:forecaster_app/data/rider_details.dart';
import 'package:forecaster_app/widgets/custom_card_widget.dart';

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final riderDetials = RiderDetails();

    return GridView.builder(
      itemCount: riderDetials.riderData.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 15,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, index) => CustomCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              riderDetials.riderData[index].icon,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                riderDetials.riderData[index].value,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              riderDetials.riderData[index].title,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
