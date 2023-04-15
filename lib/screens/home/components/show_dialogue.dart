// function to show dialogue that shows project details
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyrillos/core/constants/constants.dart';
import 'package:kyrillos/core/extenstions/sized_box_extension/sized_box_.dart';
import 'package:kyrillos/models/Project.model.dart';
import 'package:kyrillos/screens/home/theme.dart';
import 'package:url_launcher/link.dart';

void showDialogBox(BuildContext context, Project project) {
  var projectASList = project.description.toString().split('-');
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of container as a dialog
      var scrollbarController = ScrollController();
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.8,
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
                // Padding(
                //   padding: const EdgeInsets.all(customPadding),
                //   child: AutoSizeText(
                //     project.description.toString(),
                //     style: descriptionTextStyle,
                //     maxLines: 4,
                //     overflow: TextOverflow.ellipsis,
                //   ),
                // ),
                SizedBox(
                  height: currentWidth(context) <= 500
                      ? MediaQuery.of(context).size.height * 0.6
                      : MediaQuery.of(context).size.height * 0.5,
                  child: ScrollbarTheme(
                    data: ScrollbarThemeData(
                      thumbVisibility: MaterialStateProperty.all(true),
                      thumbColor: MaterialStateProperty.all(primaryColor),
                    ),
                    child: Scrollbar(
                      controller: scrollbarController,
                      child: ListView.builder(
                        controller: scrollbarController,
                        shrinkWrap: true,
                        itemCount: projectASList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(customPadding),
                            child: AutoSizeText(
                              index == 0
                                  ? "${projectASList[index]}:"
                                  : "   - ${projectASList[index]}",
                              style: descriptionTextStyle,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        },
                      ),
                    ),
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
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.05,
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
                          foregroundColor: primaryColor,
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
  var projectASList = project.description.toString().split('-');
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var scrollbarController = ScrollController();
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
            SizedBox(
              height: currentWidth(context) <= 500
                  ? MediaQuery.of(context).size.height * 0.6
                  : MediaQuery.of(context).size.height * 0.5,
              child: ScrollbarTheme(
                data: ScrollbarThemeData(
                  thumbVisibility: MaterialStateProperty.all(true),
                  thumbColor: MaterialStateProperty.all(primaryColor),
                ),
                child: Scrollbar(
                  controller: scrollbarController,
                  child: ListView.builder(
                    controller: scrollbarController,
                    shrinkWrap: true,
                    itemCount: projectASList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(customPadding),
                        child: AutoSizeText(
                          index == 0
                              ? "${projectASList[index]}:"
                              : "   - ${projectASList[index]}",
                          style: descriptionTextStyle,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const Spacer(),
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
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.05,
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
            18.vSizedBox(),
          ],
        ),
      );
    },
  );
}
