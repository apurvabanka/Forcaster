import 'package:forecaster_app/models/rider_details_model.dart';

class RiderDetails {
  final riderData = const [
    RiderDetailsModel(
        icon: 'assets/icons/burn.png', value: "3.5", title: "Delivery Rating"),
    RiderDetailsModel(
        icon: 'assets/icons/distance.png', value: "23mins", title: "Delivery Time"),
    RiderDetailsModel(
        icon: 'assets/icons/steps.png', value: "12", title: "Orders Today"),
    RiderDetailsModel(
      icon: 'assets/icons/order.png', value: "79", title: "Total Orders"),
  ];
}