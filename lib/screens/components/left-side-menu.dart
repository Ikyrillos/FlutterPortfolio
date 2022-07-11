import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyrillos/constants.dart';
import 'package:kyrillos/screens/components/about-info.dart';
import 'package:kyrillos/screens/components/animated-circular-indicator.dart';
import 'package:kyrillos/screens/components/animated_linear_circular.dart';
import 'package:kyrillos/screens/components/knowledge_text.dart';
import 'package:kyrillos/screens/components/section_title.dart';
import 'package:kyrillos/screens/home/components/area-info-text.dart';
import 'package:url_launcher/link.dart';

class LeftSideMenu extends StatelessWidget {
  const LeftSideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AboutInfo(),
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              padding: const EdgeInsets.all(customPadding),
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
                        width: customPadding,
                      ),
                      Expanded(
                        child: AnimatedCircularIndicator(
                          percentageValue: 0.75,
                          label: 'Dart',
                        ),
                      ),
                      SizedBox(
                        width: customPadding,
                      ),
                      Expanded(
                        child: AnimatedCircularIndicator(
                          percentageValue: 0.60,
                          label: 'NodeJS',
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
                    padding: const EdgeInsets.all(customPadding),
                    child: Text(
                      'Technologies',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  const KnowledgeText(text: 'Flutter, Dart, OOP, Bloc'),
                  const KnowledgeText(text: 'NodeJS, PostgreSQL, Express'),
                  const KnowledgeText(text: 'Firebase, TypeScript, Git'),
                  const Divider(),
                  Link(
                    target: LinkTarget.blank,
                    uri: Uri.parse(
                        'https://drive.google.com/file/d/1Ym0sd6XHDsEha1i4yIjvltPtWBshNvT9/view?usp=sharing'),
                    builder: (context, followLink) => TextButton(
                      onPressed: followLink,
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              'Download CV',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            const SizedBox(
                              width: customPadding,
                            ),
                            SvgPicture.asset('assets/icons/download.svg'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: customPadding),
                    child: Container(
                      color: const Color(0xFF26262E),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Spacer(),
                          Link(
                            target: LinkTarget.blank,
                            uri: Uri.parse(
                                'https://www.linkedin.com/in/kyrillosmaher/'),
                            builder: (context, followLink) => IconButton(
                              splashRadius: 23,
                              onPressed: followLink,
                              icon:
                                  SvgPicture.asset('assets/icons/linkedin.svg'),
                            ),
                          ),
                          Link(
                            target: LinkTarget.blank,
                            uri: Uri.parse('https://github.com/Ikyrillos'),
                            builder: (context, followLink2) => IconButton(
                              splashRadius: 23,
                              onPressed: followLink2,
                              icon: SvgPicture.asset('assets/icons/github.svg'),
                            ),
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
        AnimatedLinearProgressIndicator(label: 'APIs', percentageValue: 0.80),
        AnimatedLinearProgressIndicator(
            label: 'Typescript', percentageValue: 0.60),
        AnimatedLinearProgressIndicator(label: 'Firebase', percentageValue: 0.70),
        AnimatedLinearProgressIndicator(label: 'Git', percentageValue: 0.65),
        AnimatedLinearProgressIndicator(
            label: 'JavaScript, Html, CSS ', percentageValue: 0.60),

      ],
    );
  }
}
