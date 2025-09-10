import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/welcome_screen/provider/provider.dart';
import 'package:sizable/sizable.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WelcomeScreenNotifier>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            // App Logo
            // Text(
            //   "pawtopia",
            //   style: TextStyle(
            //     fontSize: 18.sp,
            //     fontWeight: FontWeight.bold,
            //     color: const Color(0xFF004D40),
            //   ),
            // ),

            // Image
            Expanded(
              child: Image.asset(
                provider.currentPage["image"]!,
                // width: 60.w,
                height: 60.h,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 20.sp),
            // Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Text(
                provider.currentPage["title"]!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall
              ),
            ),

            SizedBox(height: 10.sp),

            // Subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                provider.currentPage["subtitle"]!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium
              ),
            ),

            10.sp.sizeh,
            // Next Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
              child: ElevatedButton(
                onPressed: () => provider.nextPage(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF004D40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(double.infinity, 60.h),
                ),
                child: Text(
                  provider.isLastPage ? "Get Started" : "Next",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
            20.sp.sizeh,
          ],
        ),
      ),
    );
  }
}
