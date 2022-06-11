import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_dev/screens/home/components/background_banner.dart';
import 'package:portfolio_dev/screens/main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScreen(
      children: [
        BackgroundBanner()
      ],
    );
  }
}
