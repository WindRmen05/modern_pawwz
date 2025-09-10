import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sizable/sizable.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      "title": "Dog",
      "color": Color(0xFFFFF59D),
      "icon": "assets/icons/dog.png"
    },
    {
      "title": "Cat",
      "color": Color(0xFFB39DDB),
      "icon": "assets/icons/cat.png"
    },
    {
      "title": "Bird",
      "color": Color(0xFFFFCDD2),
      "icon": "assets/icons/bird.png"
    },
    {
      "title": "Dog",
      "color": Color(0xFFFFF59D),
      "icon": "assets/icons/dog.png"
    },
    {
      "title": "Cat",
      "color": Color(0xFFB39DDB),
      "icon": "assets/icons/cat.png"
    },
    {
      "title": "Bird",
      "color": Color(0xFFFFCDD2),
      "icon": "assets/icons/bird.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 3.w),
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            margin: spacingSym(v:0,h:2),
            width: 90.w,
            decoration: BoxDecoration(
              color: category["color"],
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(3.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 10.sp.sizeh,
                Text(
                  category["title"],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                    // fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                10.sp.sizeh,
                Image.asset(
                  category["icon"],
                  // width: 70.w,
                  height: 70.h,
                  fit: BoxFit.cover,
                ),
                10.sp.sizeh,
              ],
            ),
          );
        },
      ),
    );
  }
}
