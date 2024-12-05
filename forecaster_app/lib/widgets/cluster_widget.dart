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
          'Custers',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        CustomPaint(
          size: const Size(450, 300),
          painter: ScatterPlotPainter(controller.points),
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
          ((point.delivery_location_longitude + 180) / 360) * size.width * 2 - 400;
      final normalizedY =
          ((90 - point.delivery_location_latitude) / 180) * size.height * 2 - 150;

      canvas.drawCircle(Offset(normalizedX, normalizedY), 5, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
