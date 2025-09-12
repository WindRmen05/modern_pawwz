import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HealthAnalytics extends StatelessWidget {
  final int vaccinesTaken;
  final int vaccinesPending;
  final double healthScore;

  const HealthAnalytics({
    super.key,
    required this.vaccinesTaken,
    required this.vaccinesPending,
    required this.healthScore,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStat("Vaccines Taken", "$vaccinesTaken", context),
                _buildStat("Pending", "$vaccinesPending", context),
                _buildStat("Health Score", "${healthScore.toInt()}%", context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String title, String value, BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 14.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
