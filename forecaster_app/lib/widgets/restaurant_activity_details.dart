import 'package:flutter/material.dart';
import 'package:forecaster_app/data/restaurant_details.dart';
import 'package:forecaster_app/widgets/custom_card_widget.dart';

class RestaurantDetailsCard extends StatelessWidget {
  const RestaurantDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantDetails = RestaurantDetails();

    return GridView.builder(
      itemCount: restaurantDetails.restaurantData.length,
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
              restaurantDetails.restaurantData[index].icon,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                restaurantDetails.restaurantData[index].value,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              restaurantDetails.restaurantData[index].title,
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
