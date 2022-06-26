import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_dev/constants.dart';
import 'package:portfolio_dev/models/Project.model.dart';
import 'package:portfolio_dev/screens/home/components/background_banner.dart';
import 'package:portfolio_dev/screens/main_screen.dart';
import 'package:url_launcher/link.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  // get project list from firestore
  Stream<List<Project>> getProjectList() => FirebaseFirestore.instance
          .collection('projects')
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          return Project.fromJson(doc.data());
        }).toList();
      });
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      children: [
        const BackgroundBanner(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(customPadding),
              child: Text(
                "My Projects",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(height: customPadding),
            Padding(
              padding: const EdgeInsets.only(
                left: customPadding,
                right: customPadding,
              ),
              child: StreamBuilder(
                stream: getProjectList(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Project>> snapshot) {
                  if (snapshot.hasData) {
                    final projects = snapshot.data;
                    return ProjectsCustomGridView(
                      projects: projects,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class ProjectsCustomGridView extends StatelessWidget {
  ProjectsCustomGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.3,
    required this.projects,
  }) : super(key: key);
  List<Project>? projects;
  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projects!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: customPadding,
        mainAxisSpacing: customPadding,
      ),
      itemBuilder: (context, index) => ProjectWindow(
        project: projects![index],
      ),
    );
  }
}

// ignore: must_be_immutable
class ProjectWindow extends StatelessWidget {
  ProjectWindow({Key? key, required this.project}) : super(key: key);
  Project? project;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(6.0, 6.0),
              blurRadius: 16.0,
            ),
          ],
          color: darkColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(customPadding),
              child: AutoSizeText(project!.title.toString(),
                  style: Theme.of(context).textTheme.headline6),
            ),
            Padding(
              padding: const EdgeInsets.all(customPadding),
              child: AutoSizeText(
                project!.description.toString(),
                style: descriptionTextStyle,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            // TODO: fix ProjectWindow overflow
            Padding(
              padding: const EdgeInsets.all(customPadding),
              child: Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: primaryColor,
                    ),
                    onPressed: () {
                      showDialogBox(context, project!);
                    },
                    child: const AutoSizeText('More & Source Code'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// function to show dialogue that shows project details
void showDialogBox(BuildContext context, Project project) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of container as a dialog
      return Scaffold(
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
                        child: Text(
                          project.link.toString(),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(customPadding),
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
