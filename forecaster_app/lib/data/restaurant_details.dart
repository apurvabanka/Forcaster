import 'package:forecaster_app/models/restaunrant_details_model.dart';

class RestaurantDetails {
  final restaurantData = const [
    RestaurantDetailsModel(
        icon: 'assets/icons/p1.png',
        value: "7.8 km",
        title: "Average Delivery Distance"),
    RestaurantDetailsModel(
        icon: 'assets/icons/p2.png', value: "Snacks", title: "More Ordered"),
    RestaurantDetailsModel(
        icon: 'assets/icons/p3.png',
        value: "28.33 min",
        title: "Average Delivery Time"),
    RestaurantDetailsModel(
        icon: 'assets/icons/p4.png',
        value: "18 min",
        title: "Average Preparation Time"),
  ];
}
