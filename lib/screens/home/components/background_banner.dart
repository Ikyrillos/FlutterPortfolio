import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kyrillos/core/constants/constants.dart';
import 'package:kyrillos/screens/components/background_animated_tests.dart';
import 'package:kyrillos/screens/home/theme.dart';

// ignore: must_be_immutable
class BackgroundBanner extends StatelessWidget {
  BackgroundBanner({
    Key? key,
  }) : super(key: key);
  bool isDesktop = false;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 1,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            backgroundImg,
            fit: BoxFit.cover,
            height: currentWidth(context) < 610
                ? MediaQuery.of(context).size.height / 2.5
                : null,
          ),
          Container(
            color: darkColor.withOpacity(0.66),
            child: Padding(
              padding: const EdgeInsets.all(customPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Things don\'t turn up in this world\n until somebody turns them up.',
                    style: MediaQuery.of(context).size.width > 800
                        ? Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: Colors.white)
                        : Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.white),
                  ),
                  const BackgroundAnimatedTexts(),
                  const SizedBox(
                    height: customPadding,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
