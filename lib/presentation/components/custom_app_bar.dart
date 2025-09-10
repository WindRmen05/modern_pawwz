import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/core/theme/app_colors.dart';
import 'package:modern_pawwz/main.dart';
import 'package:sizable/sizable.dart';

CustomAppBar({String? profileImage,String? location}) {
  return AppBar(
    leadingWidth: 80.sp,
    // toolbarHeight: 80.sp,
    // automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: Theme
        .of(navigator.currentState!.context)
        .scaffoldBackgroundColor,
    leading: Padding(
      padding: spacingOnly(l:10.sp),
      child: CircleAvatar(
        radius: 18.sp,
        backgroundImage: AssetImage(profileImage ?? ''),
      ),
    ),
    title: InkWell(
      onTap: () {

      },
      child: SizedBox(
        // height: 20.sp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Location",
              style: Theme.of(navigator.currentState!.context).textTheme.bodySmall?.copyWith(
                color: Theme.of(navigator.currentState!.context).textTheme.bodySmall?.color?.withOpacity(0.7),
                fontSize: 10.sp,
              ),
            ),
            Row(
              children: [
                Text(
                  location ??'',
                  style: Theme.of(navigator.currentState!.context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down, size: 18),
              ],
            ),
          ],
        ),
      ),
    ),
    actions: [
      IconButton(
        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppColors.darkAccent)),
        onPressed: (){},
        icon: const Icon(Icons.notifications_none),
        color: Theme
            .of(navigator.currentState!.context)
            .iconTheme
            .color,
      ),
      30.sp.sizew,
    ],
  );
}