import 'package:flutter/material.dart';
import 'package:portfolio_dev/constants.dart';
import 'package:portfolio_dev/screens/components/background_animated_tests.dart';

class BackgroundBanner extends StatelessWidget {
  const BackgroundBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/rwp.jpeg',
            fit: BoxFit.cover,
          ),
          Container(
            color: darkColor.withOpacity(0.66),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: customPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Things don\'t turn up in this world\n until somebody turns them up.',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
                const BackgroundAnimatedTexts(),
                const SizedBox(
                  height: customPadding,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Explore now',
                      style: TextStyle(
                        color: darkColor,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
