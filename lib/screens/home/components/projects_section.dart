import 'package:flutter/material.dart';
import 'package:kyrillos/constants.dart';
import 'package:kyrillos/models/Project.model.dart';
import 'package:kyrillos/screens/home/components/project_window.dart';

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
    return AspectRatio(
      aspectRatio: childAspectRatio,
      child: GridView.builder(
        shrinkWrap: true,
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
      ),
    );
  }
}

// todo fix responsiveness of the portfolio that is not responsive on mobile and grid view on desktop and drawer on mobile
// ignore: must_be_immutable
class CustomListViewBuilder extends StatefulWidget {
  CustomListViewBuilder({Key? key, this.input}) : super(key: key) {
    _project = input;
  }
  List<Project>? input;
  static List<Project>? _project;
  @override
  State<CustomListViewBuilder> createState() => _CustomListViewBuilderState();
  static get project => _project;
}

class _CustomListViewBuilderState extends State<CustomListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: CustomListViewBuilder.project.length,
        itemBuilder: (context, index) => ListTile(
          title: ListTile(
              title:
                  ProjectListTile(project: CustomListViewBuilder.project[index])),
        ),
      ),
    );
  }
}
