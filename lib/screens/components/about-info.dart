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
              backgroundImage: AssetImage('images/profilepic.jpg'),
            ),
            const Spacer(),
            Text(
              'Kyrillos Maher',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const Text(
              'Flutter Developer and Backend-Developer',
              style: TextStyle(
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
