// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kyrillos/core/constants/constants.dart';

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
                  child: AutoSizeText(
                    '${(value * 100).toInt()}%',
                    style: Theme.of(context).textTheme.titleMedium,
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
          style: Theme.of(context).textTheme.titleSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
