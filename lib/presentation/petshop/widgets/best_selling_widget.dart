// Best Selling Section
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellingSection extends StatelessWidget {
  const BestSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Try Our BEST SELLING",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 8.sp),
        Text(
          "Salmon & Chickens Food",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(height: 12.sp),
        SizedBox(
          height: 120.sp,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(6, (index) {
              return Container(
                margin: EdgeInsets.only(right: 12.sp),
                width: 100.sp,
                color: Colors.grey[300],
                child: Center(child: Text("Food $index")),
              );
            }),
          ),
        )
      ],
    );
  }
}