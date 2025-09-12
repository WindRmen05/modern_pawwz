import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewItem extends StatelessWidget {
  final String name;
  final double rating;
  final String date;
  final String review;

  const ReviewItem({
    super.key,
    required this.name,
    required this.rating,
    required this.date,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 20.r, backgroundColor: Colors.blue[100]),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: Theme.of(context).textTheme.titleSmall),
                    Row(
                      children: [
                        Icon(Icons.star,
                            color: Colors.amber, size: 16.sp),
                        Text("$rating",
                            style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(width: 6.w),
                        Text(date,
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 8.h),
            Text(review, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
