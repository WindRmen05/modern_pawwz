import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/doctor_details/view/doctor_details_page.dart';
import 'package:modern_pawwz/presentation/doctor_listing/provider/doctor_listing_provider.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DoctorDetailsPage.routeName,
            arguments: doctor);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Info
              Row(
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundImage: AssetImage("assets/images/doctor.png"),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(doctor.name,
                            style: Theme.of(context).textTheme.titleMedium),
                        SizedBox(height: 4.h),
                        Text(
                          "${doctor.specialty} • ${doctor.distance}km",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16.sp),
                            Text("${doctor.rating} ",
                                style: Theme.of(context).textTheme.bodySmall),
                            Text("(${doctor.reviews})",
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),

              SizedBox(height: 8.h),

              // Availability Remote/Onsite
              Row(
                children: [
                  if (doctor.availableRemotely)
                    Row(
                      children: [
                        Icon(Icons.videocam, color: Colors.green, size: 16.sp),
                        SizedBox(width: 4.w),
                        Text("Available Remotely",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.green)),
                      ],
                    ),
                  if (doctor.remoteOnly)
                    Text("Remote Only",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.red)),
                ],
              ),

              SizedBox(height: 8.h),

              // Date Slots
              Row(
                children: doctor.availability.map((slot) {
                  bool available = slot["status"];
                  return Container(
                    margin: EdgeInsets.only(right: 8.w),
                    padding:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: available ? Colors.green[50] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      slot["date"],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: available ? Colors.green : Colors.grey[600]),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
