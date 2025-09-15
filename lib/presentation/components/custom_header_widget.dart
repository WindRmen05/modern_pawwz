import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/core/theme/app_colors.dart';
import 'package:modern_pawwz/main.dart';

CustomHeaderWidget(String header,
    {String? subtitles, bool isSeeAll = false, Function? onTap,EdgeInsets? padding}) {
  return Container(
    padding: padding,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                header,
                style: Theme.of(navigator.currentState!.context)
                    .textTheme
                    .titleLarge,
              ),
              if (subtitles != null)
                Text(
                  subtitles ?? '',
                  style: Theme.of(navigator.currentState!.context)
                      .textTheme
                      .bodyMedium,
                ),
            ],
          ),
        ),
        if (isSeeAll)
          Expanded(
            flex: 2,
            child: IconButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(AppColors.lightPrimary)),
              onPressed: () => onTap!(),
              icon: Icon(
                Icons.arrow_forward_rounded,
                size: 22.sp,
                color: Colors.white,
              ),
            ),
          ),
      ],
    ),
  );
}
