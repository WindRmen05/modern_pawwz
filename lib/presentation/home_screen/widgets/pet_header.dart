import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PetHeader extends StatelessWidget {
  final String petName;
  const PetHeader({super.key, required this.petName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // CircleAvatar(
        //   radius: 30.r,
        //   backgroundImage: AssetImage("assets/pet.png"),
        // ),
        SizedBox(width: 12.w),
        Text(
          "Hello, $petName 🐾",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            // fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
