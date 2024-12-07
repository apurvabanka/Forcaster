import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:forecaster_app/models/point.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ClusteringController extends GetxController {
  List<Point> points = [];

  Future<Map<String, dynamic>> fetchJsonData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  void fetchData() async {
    Map<String, dynamic> json =
        await fetchJsonData("http://127.0.0.1:8080/list-clustering-results/");

    List<dynamic> pointsFromJson = json['results'];

    for (int i = 0; i < pointsFromJson.length / 4; i++) {
      points.add(
        Point(
          cluster: pointsFromJson[i]['cluster'],
          delivery_location_latitude: pointsFromJson[i]
              ['delivery_location_latitude'],
          delivery_location_longitude: pointsFromJson[i]
              ['delivery_location_longitude'],
        ),
      );
    }
  }
}
