import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kyrillos/core/constants/constants.dart';
import 'package:kyrillos/core/extenstions/sized_box_extension/sized_box_.dart';
import 'package:kyrillos/screens/components/left-side-menu.dart';
import 'package:kyrillos/screens/home/theme.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: currentWidth(context) < 1128
          ? PreferredSize(
              preferredSize: const Size(
                double.infinity,
                56.0,
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: AppBar(
                    title: const Text('Portfolio'),
                    centerTitle: true,
                    leading: null,
                    elevation: 0.0,
                    backgroundColor: Colors.black.withOpacity(0.2),
                    surfaceTintColor: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            )
          : null,
      drawer: const NavigationDrawer(),
      body: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            currentWidth(context) < 1128
                ? const SizedBox()
                : const Expanded(
                    flex: 2,
                    child: LeftSideMenu(),
                  ),
            if (currentWidth(context) > 510)
              const SizedBox(
                width: customPadding,
              ),
            if (currentWidth(context) < 1128) 5.hSizedBox(),
            Expanded(
              flex: 7,
              child: ListView(
                shrinkWrap: true,
                children: [
                  ...children,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return currentWidth(context) < 1128
        ? const Drawer(
            child: LeftSideMenu(),
          )
        : const SizedBox();
  }
}
