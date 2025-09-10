import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/components/custom_back_button.dart';
import 'package:modern_pawwz/presentation/pets_details/widgets/contact_info_widget.dart';
import 'package:modern_pawwz/presentation/pets_details/widgets/pet_info_widget.dart';
import 'package:sizable/sizable.dart';

class PetDetailsBody extends StatelessWidget {
  const PetDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackButtonAppBar(),
      body: Padding(
        padding: spacing(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pet Image
            ClipRRect(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.sp)),
              child: Image.asset(
                "assets/images/dog.jpg",
                width: double.infinity,
                height: 250.sp,
                fit: BoxFit.cover,
              ),
            ),
            20.sp.sizeh,
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title + Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Golden Retriever",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                // fontSize: 13.sp,
                              ),
                        ),
                        Text(
                          "\$162",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                                // fontSize: 13.sp,
                              ),
                        ),
                      ],
                    ),

                    SizedBox(height: 1.h),

                    // Distance
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            size: 20.sp, color: Colors.grey),
                        SizedBox(width: 1.w),
                        Text(
                          "Distance (Near 10km)",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(),
                        ),
                      ],
                    ),

                    20.sp.sizeh,

                    // Pet Info Cards
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PetInfoCard(title: "Sex", value: "Male"),
                        PetInfoCard(title: "Age", value: "10 months"),
                        PetInfoCard(title: "Weight", value: "4.5kg"),
                      ],
                    ),

                    20.sp.sizeh,

                    // Contact Section
                    Text(
                      "Main Contact",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            // fontSize: 11.sp,
                          ),
                    ),
                    10.sp.sizeh,
                    const ContactInfo(
                      name: "Adam William",
                      location: "Chicago, US",
                      profileImage: "assets/images/profile.jpg",
                    ),

                    SizedBox(height: 3.h),

                    // Summary
                    Text(
                      "Summary",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            // fontSize: 11.sp,
                          ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "Golden Retrievers are loyal, friendly, smart, and eager to please. They are great family pets and excellent working dogs.",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                    ),
                  ],
                ),
              ),
            ),
            20.sp.sizeh,

            // Adopt Button
            SizedBox(
              width: double.infinity,
              height: 50.sp,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 1.8.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.sp),
                  ),
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: () {},
                child: Text(
                  "Adopt this pet",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        // fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            30.sp.sizeh,
          ],
        ),
      ),
    );
  }
}
