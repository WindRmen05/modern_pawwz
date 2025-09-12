import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/ai_chat_bot/view/ai_chat_bot_page.dart';
import 'package:modern_pawwz/presentation/doctor_listing/view/doctor_listing_page.dart';
import 'package:modern_pawwz/presentation/pet_event/view/pet_event_page.dart';
import 'package:modern_pawwz/presentation/petshop/view/petshop_page.dart';

class ServicesGrid extends StatelessWidget {
  final List<Map<String, dynamic>> services;
  const ServicesGrid({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: services.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
      ),
      itemBuilder: (context, index) {
        final service = services[index];
        return Card(
          color: service["color"],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: InkWell(
            onTap: () {
              if (index == 2) {
                Navigator.pushNamed(context, PetshopPage.routeName);
              }
              if (index == 3) {
                Navigator.pushNamed(context, PetEventPage.routeName);
              }
              if (index == 1) {
                Navigator.pushNamed(context, DoctorListingPage.routeName);
              }
              if (index == 5) {
                Navigator.pushNamed(context, AiChatBotPage.routeName);
              }
            },
            borderRadius: BorderRadius.circular(16.r),
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(service["icon"], size: 28.sp, color: Colors.blue),
                // SizedBox(height: 8.h),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    service["label"],
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          // fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Positioned(
                  top: 30,
                  bottom: 0,
                  right:0,
                  left: 20,
                  child: Image.asset(
                    service['icon'],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
