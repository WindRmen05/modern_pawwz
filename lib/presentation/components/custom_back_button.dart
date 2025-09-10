import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/main.dart';

CustomBackButtonAppBar({
  final VoidCallback? onBack,
  final VoidCallback? onMore,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: onBack ?? () => Navigator.pop(navigator.currentState!.context),
      icon: Icon(Icons.arrow_back,
          size: 22.sp,
          color: Theme.of(navigator.currentState!.context).iconTheme.color),
    ),
    actions: [
      IconButton(
        onPressed: onMore,
        icon: Icon(Icons.more_vert,
            size: 22.sp,
            color: Theme.of(navigator.currentState!.context).iconTheme.color),
      ),
    ],
  );
}
