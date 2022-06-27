// ignore: must_be_immutable
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_dev/constants.dart';
import 'package:portfolio_dev/models/Project.model.dart';
import 'package:portfolio_dev/screens/home/components/show_dialogue.dart';

// ignore: must_be_immutable
class ProjectWindow extends StatelessWidget {
  // TODO : FIx this error render overflow error
  ProjectWindow({Key? key, required this.project}) : super(key: key);
  Project? project;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            width: 300,
            height: 300,
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
              ],
            ),
          ),
        ),
      ),
      Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 210.0)),
          TextButton(
            style: TextButton.styleFrom(primary: primaryColor),
            onPressed: () {
              showDialogBox(context, project!);
            },
            child: const AutoSizeText(
              'More & Source code',
              style: TextStyle(
                color: primaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ))
    ]);
  }
}
