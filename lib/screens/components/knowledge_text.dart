import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyrillos/core/constants/constants.dart';

class KnowledgeText extends StatelessWidget {
  const KnowledgeText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_outlined, color: primaryColor, size: 15.h),
        const SizedBox(
          width: customPadding / 2,
        ),
        AutoSizeText(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(11),
            fontWeight: FontWeight.bold,
            height: 2,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }
}
