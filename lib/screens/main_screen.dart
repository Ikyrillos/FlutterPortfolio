import 'package:flutter/material.dart';
import 'package:portfolio_dev/constants.dart';
import 'package:portfolio_dev/screens/components/left-side-menu.dart';
import 'package:portfolio_dev/screens/home/theme.dart';

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
              backgroundColor: primaryColor,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
            )
          : null,
      drawer: const Drawer(
        child: LeftSideMenu(),
      ),
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...children,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
