import 'package:flutter/material.dart';
import 'package:kyrillos/core/constants/constants.dart';

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator({
    Key? key,
    required this.label,
    required this.percentageValue,
  }) : super(key: key);
  final String label;
  final double percentageValue;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: percentageValue),
        duration: customDuration,
        builder: (context, double value, child) => Padding(
              padding: const EdgeInsets.only(bottom: customPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        '${(percentageValue * 100).toInt()}%',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: customPadding,
                  ),
                  LinearProgressIndicator(
                    value: value,
                    backgroundColor: darkColor,
                    color: primaryColor,
                  ),
                ],
              ),
            ));
  }
}
