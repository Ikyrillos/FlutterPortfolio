// ignore: must_be_immutable
import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kyrillos/constants.dart';
import 'package:kyrillos/core/extenstions/sized_box_extension/sized_box_.dart';
import 'package:kyrillos/models/Project.model.dart';
import 'package:kyrillos/screens/home/components/show_dialogue.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      aspectRatio: 1,
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
          width: MediaQuery.of(context).size.width,
          height: 500.w,
          constraints: BoxConstraints(minHeight: 500.w),
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
              2.vSizedBox(),
              Padding(
                padding: const EdgeInsets.only(
                  left: customPadding,
                  right: customPadding,
                  top: 20.0,
                ),
                child: Container(
                  width: 300.w,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: AutoSizeText(widget.project!.title.toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                ),
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
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(100.w, 20.h),
                  backgroundColor: primaryColor.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ),
                ),
                onPressed: () {
                  showDialogBox(context, widget.project!);
                },
                child: const Text('View'),
              ),
              16.vSizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
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
    log(MediaQuery.of(context).size.width.toString());
    return InkWell(
      onHover: (val) {
        setState(() {
          isHover = val;
        });
      },
      onTap: () {
        showMobileDialogBox(context, widget.project!);
      },
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: Container(
          constraints: BoxConstraints(
              minHeight: 250.0, minWidth: MediaQuery.of(context).size.width),
          margin: EdgeInsets.only(
              bottom: 26.0.w, right: customPadding, left: customPadding),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: isHover
                    ? primaryColor.withOpacity(0.1)
                    : Colors.black.withOpacity(0.2),
                offset: const Offset(0.0, 0.0),
                blurRadius: 10.0,
              ),
            ],
            // color: darkColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 250.h,
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
                2.vSizedBox(),
                Padding(
                  padding: const EdgeInsets.all(customPadding),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: AutoSizeText(widget.project!.title.toString(),
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
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
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(300.w, 35.h),
                    backgroundColor: primaryColor.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                    ),
                  ),
                  onPressed: () {
                    showMobileDialogBox(context, widget.project!);
                  },
                  child: const Text('View'),
                ),
                16.vSizedBox(),
              ],
            ),
          )),
    );
  }
}
