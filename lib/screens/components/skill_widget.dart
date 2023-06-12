// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:kyrillos/core/constants/constants.dart';

class SkillWidget extends StatelessWidget {
  const SkillWidget(
      {Key? key,
      this.logo,
      required this.label,
      this.iconData,
      this.image,
      this.customSize = 60})
      : super(key: key);
  final String? logo;
  final IconData? iconData;
  final String? image;
  final String label;
  final double? customSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (image != null)
          Image.asset(
            image!,
            width: customSize,
            height: customSize,
            fit: BoxFit.contain,
          ),
        if (iconData != null)
          AspectRatio(
            aspectRatio: 1,
            child: Icon(
              iconData,
              color: primaryColor,
              size: 50,
            ),
          ),
        const Spacer(),
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
