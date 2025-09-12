import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventProgressBar extends StatelessWidget {
  final int count;
  final int currentIndex;

  const EventProgressBar({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(count, (index) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            height: 4.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: index <= currentIndex ? Colors.white : Colors.white38,
            ),
          ),
        );
      }),
    );
  }
}
