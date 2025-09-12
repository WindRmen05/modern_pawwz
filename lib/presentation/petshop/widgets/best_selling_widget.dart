// Best Selling Section
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/core/theme/app_colors.dart';
import 'package:modern_pawwz/presentation/components/custom_header_widget.dart';

class BestSellingSection extends StatelessWidget {
  const BestSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CustomHeaderWidget(
          "Try Our BEST SELLING",
              subtitles: "Healthy food",
          isSeeAll: true,
          onTap: () {

          }
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