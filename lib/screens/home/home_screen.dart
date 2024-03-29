import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kyrillos/core/constants/constants.dart';
import 'package:kyrillos/core/extenstions/sized_box_extension/sized_box_.dart';
import 'package:kyrillos/models/Project.model.dart';
import 'package:kyrillos/screens/home/components/background_banner.dart';
import 'package:kyrillos/screens/home/components/projects_section.dart';
import 'package:kyrillos/screens/home/theme.dart';
import 'package:kyrillos/screens/main_screen.dart';

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
        BackgroundBanner(),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            12.vSizedBox(),
            Padding(
              padding: const EdgeInsets.all(customPadding),
              child: Text(
                "My Projects",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: customPadding,
                top: 12.0,
              ),
              child: StreamBuilder(
                stream: getProjectList(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Project>> snapshot) {
                  if (snapshot.hasData) {
                    final projects = snapshot.data;
                    return currentWidth(context) < 1130
                        ? CustomListViewBuilder(
                            input: projects,
                          )
                        : ProjectsCustomGridView(
                            projects: projects,
                            childAspectRatio: 1,
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
            50.vSizedBox(),
          ],
        )
      ],
    );
  }
}
