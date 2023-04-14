// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AboutInfo extends StatelessWidget {
  const AboutInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: const Color(0xff242430),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(
              flex: 2,
            ),
            const CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage('assets/images/profilepic.jpg'),
            ),
            const Spacer(),
            AutoSizeText(
              'Kyrillos Maher',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const AutoSizeText(
              'Flutter Developer and Instructor',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w200,
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
