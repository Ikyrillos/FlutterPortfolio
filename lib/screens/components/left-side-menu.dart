// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart' show BoxIcons, Bootstrap;
import 'package:kyrillos/core/constants/personal_constants.dart';
import 'package:url_launcher/link.dart';
import 'package:kyrillos/core/constants/constants.dart';
import 'package:kyrillos/screens/components/about-info.dart';
import 'package:kyrillos/screens/components/skill_widget.dart';
import 'package:kyrillos/screens/components/section_title.dart';
import 'package:kyrillos/screens/home/components/area-info-text.dart';

class LeftSideMenu extends StatelessWidget {
  const LeftSideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      surfaceTintColor: bgColor,
      child: Container(
        margin: const EdgeInsets.all(8),
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
                    AreaInfoText(
                        label: 'Age', text: '${DateTime.now().year - 1999}'),
                    Link(
                      target: LinkTarget.blank,
                      uri: Uri.parse(
                          'https://drive.google.com/file/d/1iXT1udGVY1-rT2l1HmtRDpolS-P25EUQ/view?usp=share_link'),
                      builder: (context, followLink) => TextButton(
                        onPressed: followLink,
                        child: FittedBox(
                          child: Row(
                            children: [
                              Text(
                                'Download CV',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Icon(
                                BoxIcons.bx_download,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: customPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Link(
                          target: LinkTarget.blank,
                          uri:
                              Uri.parse('tel:${PersonalConstants.phoneNumber}'),
                          builder: (context, followLink) => TextButton(
                            onPressed: followLink,
                            child: FittedBox(
                              child: Row(
                                children: [
                                  Text(
                                    'contact me',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(
                                    BoxIcons.bx_phone_call,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // email me
                        Link(
                          target: LinkTarget.blank,
                          uri: Uri.parse('mailto:${PersonalConstants.email}'),
                          builder: (context, followLink) => TextButton(
                            onPressed: followLink,
                            child: FittedBox(
                              child: Row(
                                children: [
                                  Text(
                                    'email me',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(
                                    BoxIcons.bx_mail_send,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: customPadding),
                      child: Container(
                        color: secondaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Spacer(),
                            Link(
                              target: LinkTarget.blank,
                              uri: Uri.parse(
                                  'https://www.linkedin.com/in/kyrillosmaher/'),
                              builder: (context, followLink) => IconButton(
                                splashRadius: 2,
                                onPressed: followLink,
                                icon: const Icon(BoxIcons.bxl_linkedin),
                              ),
                            ),
                            Link(
                              target: LinkTarget.blank,
                              uri: Uri.parse('https://github.com/Ikyrillos'),
                              builder: (context, followLink2) => IconButton(
                                splashRadius: 2,
                                onPressed: followLink2,
                                icon: const Icon(BoxIcons.bxl_github),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    const SectionTitle(label: 'Skills:'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: const Row(
                        children: [
                          Expanded(
                            child: SkillWidget(
                              iconData: BoxIcons.bxl_flutter,
                              label: 'Flutter',
                            ),
                          ),
                          SizedBox(
                            width: customPadding,
                          ),
                          Expanded(
                            child: SkillWidget(
                              iconData: BoxIcons.bxl_android,
                              customSize: 65,
                              label: 'Android',
                            ),
                          ),
                          SizedBox(
                            width: customPadding,
                          ),
                          Expanded(
                            child: SkillWidget(
                              iconData: Bootstrap.gear_fill,
                              customSize: 35,
                              label: 'REST APIs',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 20,
                    ),
                    const SectionTitle(label: 'Worked With:'),
                    const Coding(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Coding extends StatelessWidget {
  const Coding({Key? key}) : super(key: key);
  final List<IconData> skillIcons = const [
    BoxIcons.bxl_typescript,
    BoxIcons.bxl_firebase,
    BoxIcons.bxl_javascript,
    BoxIcons.bxl_html5,
    BoxIcons.bxl_css3,
    BoxIcons.bxl_postgresql,
    Bootstrap.database,
    BoxIcons.bxl_flask,
    BoxIcons.bxl_figma,
    BoxIcons.bxl_github,
    BoxIcons.bxl_play_store,
    BoxIcons.bxl_slack,
    BoxIcons.bxl_trello,
    BoxIcons.bxl_visual_studio,
    BoxIcons.bxl_zoom,
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...skillIcons.map((e) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(e, size: 45),
          );
        }).toList(),
      ],
    );
  }
}
