import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class BackgroundAnimatedTexts extends StatelessWidget {
  const BackgroundAnimatedTexts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.subtitle1!,
      child: Row(
        children: [
          const Text('I create and develop '),
          AnimatedTextKit(animatedTexts: [
            TyperAnimatedText('Android Apps',
                textStyle: const TextStyle(
                  color: Colors.amber,
                )),
            TyperAnimatedText('iOS Apps',
                textStyle: const TextStyle(
                  color: Colors.purpleAccent,
                )),
            TyperAnimatedText('Windows Apps',
                textStyle: const TextStyle(
                  color: Colors.blueAccent,
                )),
          ])
        ],
      ),
    );
  }
}
