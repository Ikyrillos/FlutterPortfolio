import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
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
                          percentageValue: 0.60,
                          label: 'NodeJS',
                        ),
                      ),
                      SizedBox(
                        width: customPadding,
                      ),
                      Expanded(
                        child: AnimatedCircularIndicator(
                          percentageValue: 0.40,
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
                    padding: const EdgeInsets.all(customPadding),
                    child: Text(
                      'Technologies',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  const KnowledgeText(text: 'Flutter, Dart, Firebase, Bloc'),
                  const KnowledgeText(text: 'NodeJS, PostgreSQL, Express'),
                  const KnowledgeText(text: 'Angular, TypeScript, Git'),
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
        AnimatedLinearProgressIndicator(label: 'Dart', percentageValue: 0.80),
        AnimatedLinearProgressIndicator(
            label: 'Typescript', percentageValue: 0.60),
        AnimatedLinearProgressIndicator(
            label: 'JavaScript', percentageValue: 0.60),
        AnimatedLinearProgressIndicator(label: 'Html', percentageValue: 0.55),
        AnimatedLinearProgressIndicator(label: 'CSS', percentageValue: 0.55),
      ],
    );
  }
}
