// Free Delivery Section
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sizable/sizable.dart';

class FreeDeliverySection extends StatelessWidget {
  const FreeDeliverySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.sp,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      padding: EdgeInsets.all(12.sp),
      child: Center(
        child: Row(
          children: [
            Icon(Icons.ac_unit,size: 22.sp,color: Colors.white70,),
            10.sp.sizew,
            Text(
              "FREE DELIVERY in your first order",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
