import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/core/theme/app_theme.dart';
import 'package:sizable/sizable.dart';

class BackButtonWidget extends StatelessWidget {
  final bool isShadow;
  final double? bottomPad;
  final double? leftPad;
  const BackButtonWidget({
    super.key,
    this.isShadow = false,
    this.bottomPad,
    this.leftPad,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 30.sp,
        height: 30.sp,
        margin: spacingOnly(
          l: leftPad ?? 20.sp,
          b: bottomPad ?? 15.sp,
          t: 5.sp,
        ),
        padding: spacing(value: 5),
        alignment: Alignment.center,
        decoration: CustomBoxDecoration().copyWith(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
          size: 18.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}
