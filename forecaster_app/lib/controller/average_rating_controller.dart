import 'dart:convert';
import 'dart:math';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class AverageRatingController extends GetxController {
  double y_pred = 0;

  Future<Map<String, dynamic>> fetchJsonData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  double predictPolynomial(double x, List<dynamic> coefficients, double intercept) {
  double result = intercept +
      coefficients[1] * pow(x, 1) +
      coefficients[2] * pow(x, 2) +
      coefficients[3] * pow(x, 3);
  return result;
}

  void fetchData(double x) async {
    Map<String, dynamic> jsonData =
        await fetchJsonData('https://forecasterbackend-531626027781.us-east1.run.app/list-regression-results/');
    List<dynamic> coefficients = jsonData['results'][0]['coefficients'];
    double intercept = jsonData['results'][0]['intercept'];

   double predictedValue = predictPolynomial(x, coefficients, intercept);

    y_pred = predictedValue;
  }
}
