import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_dev/constants.dart';
import 'package:portfolio_dev/screens/components/about-info.dart';
import 'package:portfolio_dev/screens/components/animated-circular-indicator.dart';
import 'package:portfolio_dev/screens/components/animated_linear_circular.dart';
import 'package:portfolio_dev/screens/home/components/area-info-text.dart';
import 'package:portfolio_dev/screens/components/knowledge_text.dart';
import 'package:portfolio_dev/screens/components/section_title.dart';

class LeftSideMenu extends StatelessWidget {
  const LeftSideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const AboutInfo(),
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  AreaInfoText(label: 'Country:', text: 'Egypt'),
                  AreaInfoText(label: 'City:', text: 'Cairo'),
                  AreaInfoText(label: 'Age', text: '23'),
                  const Divider(),
                  const SectionTitle(label: 'Skills'),
                  Row(
                    children: const [
                      Expanded(
                        child: AnimatedCircularIndicator(
                          percentageValue: 0.8,
                          label: 'Flutter',
                        ),
                      ),
                      SizedBox(
                        width: defaultPadding,
                      ),
                      Expanded(
                        child: AnimatedCircularIndicator(
                          percentageValue: 0.75,
                          label: 'NodeJS',
                        ),
                      ),
                      SizedBox(
                        width: defaultPadding,
                      ),
                      Expanded(
                        child: AnimatedCircularIndicator(
                          percentageValue: 0.60,
                          label: 'Angular',
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 20,
                  ),
                  const Coding(),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Text(
                      'Technologies',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  const KnowledgeText(text: 'Flutter, Dart, Firebase, Bloc'),
                  const KnowledgeText(text: 'NodeJS, PostgreSQL, Express'),
                  const KnowledgeText(text: 'Angular, TypeScript, Git'),
                  const Divider(),
                  TextButton(
                    onPressed: () {},
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text(
                            'Download CV',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          const SizedBox(
                            width: defaultPadding,
                          ),
                          SvgPicture.asset('assets/icons/download.svg'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: defaultPadding),
                    child: Container(
                      color: const Color(0xFF26262E),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Spacer(),
                          IconButton(
                            splashRadius: 23,
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/linkedin.svg'),
                          ),
                          IconButton(
                            splashRadius: 23,
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/twitter.svg'),
                          ),
                          IconButton(
                            splashRadius: 23,
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/github.svg'),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Coding extends StatelessWidget {
  const Coding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        AnimatedLinearProgressIndicator(label: 'Dart', percentageValue: 0.80),
        AnimatedLinearProgressIndicator(
            label: 'Typescript', percentageValue: 0.70),
        AnimatedLinearProgressIndicator(label: 'Java', percentageValue: 0.60),
        AnimatedLinearProgressIndicator(
            label: 'JavaScript', percentageValue: 0.65),
        AnimatedLinearProgressIndicator(label: 'Html', percentageValue: 0.55),
        AnimatedLinearProgressIndicator(label: 'CSS', percentageValue: 0.55),
      ],
    );
  }
}
