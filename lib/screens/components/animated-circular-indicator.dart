import 'package:flutter/material.dart';
import 'package:portfolio_dev/constants.dart';

class AnimatedCircularIndicator extends StatelessWidget {
  const AnimatedCircularIndicator(
      {Key? key, required this.percentageValue, required this.label})
      : super(key: key);
  final double percentageValue;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: percentageValue),
            duration: customDuration,
            builder: (context, double value, child) => Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: percentageValue,
                  color: primaryColor,
                  backgroundColor: darkColor,
                ),
                Center(
                  child: Text(
                    '${(value * 100).toInt()}%',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: customPadding / 2,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.subtitle2,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
