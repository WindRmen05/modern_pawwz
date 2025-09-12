import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/core/theme/app_theme.dart';
import 'package:modern_pawwz/presentation/pet_event/provider/pet_event_provider.dart';
import 'package:sizable/sizable.dart';

class PetEventCard extends StatelessWidget {
  final PetEvent event;

  const PetEventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background Image
        Image.asset(
          event.image,
          fit: BoxFit.cover,
        ),

        // Dark overlay for readability
        Container(
          color: Colors.black.withOpacity(0.5),
        ),

        // Content
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                event.subtitle,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 18.sp,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 20.h),

              // Info Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _InfoBox(label: "Price", value: event.price),
                  _InfoBox(label: "Date", value: event.date),
                  _InfoBox(label: "Location", value: event.location),
                ],
              ),

              SizedBox(height: 20.h),

              // Description
              Text(
                event.description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white70,
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(height: 20.h),

              // Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.red,
                  minimumSize: Size(double.infinity, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Join Event",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              15.sp.sizeh,
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String label;
  final String value;

  const _InfoBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: spacingSym(v: 2,h:10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50.withOpacity(.7),
        borderRadius: BorderRadius.circular(3.sp),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 12.sp,
              color: Colors.black87,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 14.sp,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
