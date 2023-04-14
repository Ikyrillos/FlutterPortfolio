// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:kyrillos/constants.dart';

// ignore: must_be_immutable
class AreaInfoText extends StatelessWidget {
  String label;
  String text;
  AreaInfoText({Key? key, required this.label, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: customPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: bodyTextColor,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              color: bodyTextColor,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
