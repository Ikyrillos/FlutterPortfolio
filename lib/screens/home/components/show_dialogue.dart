// function to show dialogue that shows project details
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyrillos/constants.dart';
import 'package:kyrillos/models/Project.model.dart';
import 'package:url_launcher/link.dart';

void showDialogBox(BuildContext context, Project project) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of container as a dialog
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(customPadding),
                  child: AutoSizeText(
                    project.title.toString(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const SizedBox(height: customPadding),
                Padding(
                  padding: const EdgeInsets.all(customPadding),
                  child: AutoSizeText(
                    project.description.toString(),
                    style: descriptionTextStyle,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                if (project.link != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (project.link!.contains('github'))
                        SvgPicture.asset(
                          'assets/icons/github.svg',
                          color: primaryColor,
                          height: customPadding,
                          width: customPadding,
                        ),
                      if (project.link!.contains('play'))
                        Link(
                          target: LinkTarget.blank,
                          uri: Uri.parse(project.link.toString()),
                          builder: (context, followLink3) => TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: primaryColor,
                            ),
                            onPressed: followLink3,
                            child: SvgPicture.asset(
                              'assets/icons/playstore.svg',
                              height: 30.w,
                              width: 40.w,
                            ),
                          ),
                        ),
                      const SizedBox(width: customPadding),
                      if (!project.link!.contains('play') ||
                          !project.link!.contains('http') ||
                          !project.link!.contains('https'))
                        Link(
                          target: LinkTarget.blank,
                          uri: Uri.parse(project.link.toString()),
                          builder: (context, followLink2) => TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: primaryColor,
                            ),
                            onPressed: followLink2,
                            child: AutoSizeText(
                              project.link!.contains('github')
                                  ? 'View on Github'
                                  : 'No link available',
                              maxLines: 2,
                            ),
                          ),
                        ),
                    ],
                  ),
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: primaryColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                      const SizedBox(
                        width: customPadding,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void showMobileDialogBox(BuildContext context, Project project) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of container as a dialog
      return Scaffold(
        appBar: AppBar(
          title: Text('Projects',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(40),
                fontWeight: FontWeight.w400,
              )),
          elevation: 0,
          centerTitle: true,
        ),
        body: Column(
          // get title of the project
          children: [
            Padding(
              padding: const EdgeInsets.all(customPadding),
              child: AutoSizeText(
                project.title.toString(),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(height: customPadding),
            Padding(
              padding: const EdgeInsets.all(customPadding),
              child: AutoSizeText(
                project.description.toString(),
                style: descriptionTextStyle,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/github.svg',
                  color: primaryColor,
                  height: customPadding,
                  width: customPadding,
                ),
                const SizedBox(width: customPadding),
                Link(
                  target: LinkTarget.blank,
                  uri: Uri.parse(project.link.toString()),
                  builder: (context, followLink2) => TextButton(
                    style: TextButton.styleFrom(
                      primary: primaryColor,
                    ),
                    onPressed: followLink2,
                    child: const AutoSizeText(
                      'Project repo',
                      maxLines: 2,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                )
              ],
            ),
          ],
        ),
      );
    },
  );
}
