import 'package:flutter/material.dart';
import 'package:forecaster_app/const/constant.dart';

class ClusterWidget extends StatefulWidget {
  const ClusterWidget({super.key});

  @override
  State<ClusterWidget> createState() => _ClusterWidgetState();
}

class _ClusterWidgetState extends State<ClusterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: cardBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Stack(
              children: [
                // Title: "Clusters"
                const Positioned(
                  top: 8,
                  left: 8,
                  child: Text(
                    'Clusters',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Blue dots for clusters
                Positioned(
                  left: 50,
                  top: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(5, (index) {
                      return Row(
                        children: List.generate(3, (i) {
                          return const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.blue,
                            ),
                          );
                        }),
                      );
                    }),
                  ),
                ),
                // Star-shaped clusters
                Positioned(
                  right: 40,
                  bottom: 30,
                  child: Column(
                    children: List.generate(
                      3,
                      (index) {
                        return Row(
                          children: List.generate(3, (i) {
                            return const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 16,
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
