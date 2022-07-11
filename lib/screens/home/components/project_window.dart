// ignore: must_be_immutable
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kyrillos/constants.dart';
import 'package:kyrillos/models/Project.model.dart';
import 'package:kyrillos/screens/home/components/show_dialogue.dart';

// ignore: must_be_immutable
class ProjectWindow extends StatefulWidget {
  ProjectWindow({Key? key, required this.project}) : super(key: key);
  Project? project;

  @override
  State<ProjectWindow> createState() => _ProjectWindowState();
}

class _ProjectWindowState extends State<ProjectWindow> {
  var isHover = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 10,
      child: InkWell(
        onHover: (val) {
          setState(() {
            isHover = val;
          });
        },
        onTap: () {
          showDialogBox(context, widget.project!);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 5,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: isHover
                    ? primaryColor.withOpacity(0.1)
                    : Colors.black.withOpacity(0.2),
                offset: const Offset(0.0, 0.0),
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
                child: AutoSizeText(widget.project!.title.toString(),
                    style: Theme.of(context).textTheme.headline6),
              ),
              Padding(
                padding: const EdgeInsets.all(customPadding),
                child: AutoSizeText(
                  widget.project!.description.toString(),
                  style: descriptionTextStyle,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget projectListView(List<Project> projects) {
  return ListView.builder(
    itemCount: projects.length,
    itemBuilder: (context, index) {
      return projectListTile(context, projects[index]);
    },
  );
}

Widget projectListTile(BuildContext context, Project? project) {
  var isHover = false;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: InkWell(
      onHover: (val) {
        isHover = val;
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: isHover
                  ? primaryColor.withOpacity(0.1)
                  : Colors.black.withOpacity(0.2),
              offset: const Offset(6.0, 6.0),
              blurRadius: 16.0,
            ),
          ],
          color: darkColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          contentPadding: const EdgeInsets.all(customPadding),
          leading: const Icon(
            Icons.work,
            color: primaryColor,
          ),
          title: Text(project!.title.toString()),
          subtitle:
              Text(project.description.toString(), style: descriptionTextStyle),
          onTap: () {
            showDialogBox(context, project);
          },
        ),
      ),
    ),
  );
}
// Positioned(
//                 bottom: 0,
//                 right: 0,
//                 child: TextButton(
//                   style: TextButton.styleFrom(primary: primaryColor),
//                   onPressed: () {
//                     showDialogBox(context, project!);
//                   },
//                   child: const AutoSizeText(
//                     'More & Source code',
//                     style: TextStyle(
//                       color: primaryColor,
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),

class ProjectListTile extends StatefulWidget {
  ProjectListTile({Key? key, required this.project}) : super(key: key);
  Project? project;

  @override
  State<ProjectListTile> createState() => _ProjectListTileState();
}

class _ProjectListTileState extends State<ProjectListTile> {
  var isHover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onHover: (val) {
          setState(() {
            isHover = val;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.1),
                // isHover
                //     ? primaryColor.withOpacity(0.1)
                //     : Colors.black.withOpacity(0.2),
                // offset: const Offset(6.0, 6.0),
                // blurRadius: 16.0,
              ),
            ],
            color: darkColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            contentPadding: const EdgeInsets.all(customPadding),
            leading: const Icon(
              Icons.work,
              color: primaryColor,
            ),
            title: Text(widget.project!.title.toString()),
            subtitle: Text(
              widget.project!.description.toString(),
              style: descriptionTextStyle,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              showDialogBox(context, widget.project!);
            },
          ),
        ),
      ),
    );
  }
}
