import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sizable/sizable.dart';

class ReviewWidget extends StatelessWidget {
  final String? userName;
  final String? userAvatar;
  final double? rating;
  final String? reviewText;
  final String? date;

  const ReviewWidget({
    super.key,
    this.userName,
    this.userAvatar,
    this.rating,
    this.reviewText,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: spacingSym(h: 0, v: 5),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.shade200,
          ),
        ),
        // color: Colors.white,
        // borderRadius: BorderRadius.circular(10.r),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 4.r,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info Row
          Row(
            children: [
              CircleAvatar(
                radius: 18.r,
                backgroundImage:
                    userAvatar != null ? NetworkImage(userAvatar!) : null,
                child: userAvatar == null
                    ? Icon(Icons.person, size: 20.sp, color: Colors.grey)
                    : null,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (userName != null)
                      Text(
                        userName!,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    if (date != null)
                      Text(
                        date!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                      ),
                  ],
                ),
              ),
              if (rating != null)
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < rating!.floor() ? Icons.star : Icons.star_border,
                      color: Colors.orange,
                      size: 16.sp,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),

          // Review Text
          if (reviewText != null)
            Text(
              reviewText!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 13.sp,
                    color: Colors.black87,
                  ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}
