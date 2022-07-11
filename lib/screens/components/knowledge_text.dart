import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyrillos/constants.dart';

class KnowledgeText extends StatelessWidget {
  const KnowledgeText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          child:
              SvgPicture.asset('assets/icons/check.svg', fit: BoxFit.contain),
        ),
        const SizedBox(
          width: customPadding / 2,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}
