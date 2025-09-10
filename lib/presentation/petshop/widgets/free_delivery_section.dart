// Free Delivery Section
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FreeDeliverySection extends StatelessWidget {
  const FreeDeliverySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.sp,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      padding: EdgeInsets.all(12.sp),
      child: Center(
        child: Text(
          "FREE DELIVERY in your first order",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
