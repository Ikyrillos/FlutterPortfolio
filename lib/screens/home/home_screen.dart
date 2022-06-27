import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_dev/constants.dart';
import 'package:portfolio_dev/models/Project.model.dart';
import 'package:portfolio_dev/screens/home/components/background_banner.dart';
import 'package:portfolio_dev/screens/home/components/project_window.dart';
import 'package:portfolio_dev/screens/home/components/show_dialogue.dart';
import 'package:portfolio_dev/screens/main_screen.dart';

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

