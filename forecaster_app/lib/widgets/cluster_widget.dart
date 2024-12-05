import 'package:flutter/material.dart';
import 'package:forecaster_app/controller/clustering_controller.dart';
import 'package:forecaster_app/models/point.dart';
import 'package:get/instance_manager.dart';

class ClusterWidget extends StatefulWidget {
  const ClusterWidget({super.key});

  @override
  State<ClusterWidget> createState() => _ClusterWidgetState();
}

class _ClusterWidgetState extends State<ClusterWidget> {
  final ClusteringController controller = Get.put(ClusteringController());

  @override
  void initState() {
    super.initState();
    controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Clusters',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                // color: Colors.white, // Background color
                border: Border.all(
                  color: Colors.blue, // Outline color
                  width: 2.0, // Outline width
                ),
              ),
              child: CustomPaint(
                size: const Size(450, 300),
                painter: ScatterPlotPainter(controller.points),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '         Your Cluster: ',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Container(
              width: 25, // Width of the circle
              height: 25, // Height of the circle
              decoration: const BoxDecoration(
                color: Colors.orange, // Set the color to orange
                shape: BoxShape.circle, // Shape of the container is a circle
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ScatterPlotPainter extends CustomPainter {
  final List<Point> points;

  ScatterPlotPainter(this.points);

  Map<int, Color> cluster_color = {
    0: Colors.blue,
    1: Colors.orange,
    2: Colors.red,
    3: Colors.green,
  };

  @override
  void paint(Canvas canvas, Size size) {
    for (final point in points) {
      final Paint pointPaint = Paint()
        ..color = cluster_color[point.cluster]!
        ..style = PaintingStyle.fill;

      final normalizedX =
          ((point.delivery_location_longitude + 180) / 360) * size.width * 2 -
              400;
      final normalizedY =
          ((90 - point.delivery_location_latitude) / 180) * size.height * 2 -
              150;

      canvas.drawCircle(Offset(normalizedX, normalizedY), 5, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
