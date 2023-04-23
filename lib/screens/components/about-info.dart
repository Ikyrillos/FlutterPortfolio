// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyrillos/core/constants/constants.dart';
import 'package:url_launcher/link.dart';

class AboutInfo extends StatelessWidget {
  const AboutInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: darkColor.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(
              flex: 2,
            ),
            CircleAvatar(
              radius: 65,
              backgroundImage: Image.asset(
                  profilePic).image,
            ),
            const Spacer(),
            AutoSizeText(
              'Kyrillos Maher',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: bodyTextColor,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            const AutoSizeText(
              'Flutter Developer and Instructor',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w200,
                color: bodyTextColor,
                height: 1.5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
