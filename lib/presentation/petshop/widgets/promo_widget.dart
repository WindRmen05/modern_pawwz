// Promo Section
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoSection extends StatelessWidget {
  const PromoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.sp,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      padding: EdgeInsets.all(12.sp),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "FOCO PET 60% OFF\nUse Promo Code: GETITNOW",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(width: 12.sp),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/images/dog.jpg",fit: BoxFit.cover,),
          ),
        ],
      ),
    );
  }
}