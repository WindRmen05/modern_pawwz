import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/components/custom_schedule_picker/schedule_picker_widget.dart';
import 'package:modern_pawwz/presentation/doctor_details/doctor_details.dart';
import 'package:modern_pawwz/presentation/doctor_details/widgets/review_card.dart';
import 'package:modern_pawwz/presentation/doctor_details/widgets/status_card.dart';
import 'package:modern_pawwz/presentation/doctor_details/widgets/tab_button.dart';
import 'package:sizable/sizable.dart';

class DoctorDetailsBody extends StatelessWidget {
  const DoctorDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DoctorDetailsNotifier>(
      builder: (context, value, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(value.doctor?.name ?? '',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          body: Padding(
            padding: spacing(),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Section
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 35.r,
                              backgroundImage: AssetImage("assets/images/dog.jpg"),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(value.doctor?.name ?? '',
                                      style:
                                          Theme.of(context).textTheme.titleLarge),
                                  Text(value.doctor?.specialty ?? '',
                                      style: Theme.of(context).textTheme.bodySmall),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.amber, size: 16.sp),
                                      Text("${value.doctor?.rating}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                      SizedBox(width: 4.w),
                                      Text("(${value.doctor?.reviews} reviews)",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Text("30 m / \$90",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(fontWeight: FontWeight.w600)),
                                ],
                              ),
                            )
                          ],
                        ),
                    
                        SizedBox(height: 20.h),
                    
                        // Stats Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            StatCard(
                                title: "Visits", value: "6k", icon: Icons.home),
                            StatCard(
                                title: "Patients",
                                value: "3.7k",
                                icon: Icons.people),
                            StatCard(
                                title: "Exp", value: "15 years", icon: Icons.work),
                          ],
                        ),
                    
                        SizedBox(height: 20.h),
                    
                        // Tabs (Feedback, Docs, About)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TabButton(label: "Feedbacks", isSelected: true),
                            TabButton(label: "Docs"),
                            TabButton(label: "About"),
                          ],
                        ),
                    
                        SizedBox(height: 20.h),
                        // Reviews
                        Text("Last reviews",
                            style: Theme.of(context).textTheme.titleMedium),
                        SizedBox(height: 12.h),
                        ReviewItem(
                          name: "Nuraz Donin",
                          rating: 4,
                          date: "10 September 2024",
                          review:
                              "Dr. Saif Ababon was thorough, attentive, and took the time to answer all my questions in detail. I left feeling confident in my health and the care I received. Highly recommend!",
                        ),
                        SizedBox(height: 10.h),
                        ReviewItem(
                          name: "Allison Dorwart",
                          rating: 4.5,
                          date: "5 September 2024",
                          review:
                              "Dr. Saif Ababon was attentive, listened carefully to my concerns, and provided clear, insightful explanations.",
                        ),
                        SizedBox(height: 10.h),
                        ReviewItem(
                          name: "Allison Dorwart",
                          rating: 4.5,
                          date: "5 September 2024",
                          review:
                          "Dr. Saif Ababon was attentive, listened carefully to my concerns, and provided clear, insightful explanations.",
                        ),
                    
                        SizedBox(height: 10.h),
                        ReviewItem(
                          name: "Allison Dorwart",
                          rating: 4.5,
                          date: "5 September 2024",
                          review:
                          "Dr. Saif Ababon was attentive, listened carefully to my concerns, and provided clear, insightful explanations.",
                        ),                      // SizedBox(height: 80.h), // space for button
                      ],
                    ),
                  ),
                ),
                15.sp.sizeh,
                SchedulePicker(),
                20.sp.sizeh,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {},
                  child: Text("Schedule Now",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white)),
                ),
                20.sp.sizeh,
              ],
            ),
          ),
        );
      },
    );
  }
}
