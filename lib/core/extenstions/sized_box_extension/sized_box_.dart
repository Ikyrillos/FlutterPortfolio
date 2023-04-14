import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizedBoxExtension on num {
  /// Returns a [SizedBox] with the given [width] and [height].
  SizedBox vSizedBox() => SizedBox(
        height: toDouble().h,
      );

  SizedBox hSizedBox() => SizedBox(
        width: toDouble().w,
      );
}
