import 'package:flutter/material.dart';
import 'package:kyrillos/constants.dart';
import 'package:kyrillos/screens/components/left-side-menu.dart';
import 'package:kyrillos/screens/home/theme.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentWidth(context) < 1128
          ? AppBar(
              title: const Text('Portfolio'),
              centerTitle: true,
            )
          : null,
      drawer: const NavigationDrawer(),
      body: Container(
        constraints: const BoxConstraints(maxWidth: maxWidth),
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
            const SizedBox(
              width: customPadding,
            ),
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
