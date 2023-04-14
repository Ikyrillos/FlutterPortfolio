import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kyrillos/constants.dart';
import 'package:kyrillos/models/Project.model.dart';
import 'package:kyrillos/screens/home/components/project_window.dart';

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
  final scrollbarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: childAspectRatio,
      child: ScrollbarTheme(
        data: ScrollbarThemeData(
          thumbVisibility: MaterialStateProperty.all(false),
          thumbColor: MaterialStateProperty.all(Colors.transparent),
          mainAxisMargin: 8,
          minThumbLength: 8,
          interactive: false,
          radius: const Radius.circular(8),
        ),
        child: Scrollbar(
          controller: scrollbarController,
          thickness: 0,
          thumbVisibility: false,
          child: GridView.builder(
            controller: scrollbarController,
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
        ),
      ),
    );
  }
}

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
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyCustomScrollBehavior(),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 4,
        ),
        controller: controller,
        shrinkWrap: true,
        itemCount: CustomListViewBuilder.project.length,
        itemBuilder: (context, index) => ListTile(
          title: ProjectListTile(project: CustomListViewBuilder.project[index]),
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}