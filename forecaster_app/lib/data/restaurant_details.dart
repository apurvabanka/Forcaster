import 'package:forecaster_app/models/restaunrant_details_model.dart';

class RestaurantDetails {
  final restaurantData = const [
    RestaurantDetailsModel(
        icon: 'assets/icons/burn.png',
        value: "12345",
        title: "Average Delivery Distance"),
    RestaurantDetailsModel(
        icon: 'assets/icons/distance.png',
        value: "1234",
        title: "Delivery Time"),
    RestaurantDetailsModel(
        icon: 'assets/icons/steps.png',
        value: "1234",
        title: "Average Delivery Time"),
    RestaurantDetailsModel(
        icon: 'assets/icons/order.png',
        value: "12345",
        title: "Average Preparation Time"),
  ];
}
