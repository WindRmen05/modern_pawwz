import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:modern_pawwz/presentation/components/CustomLoadingWidget.dart';
import 'package:modern_pawwz/presentation/splash_screen/provider/provider.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashScreenNotifier>(
      builder: (context, state, child) {
        return Stack(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                "assets/json/animation1.json",
                animate: true,
                fit: BoxFit.cover,
                repeat: true,
                // height: 200.sp,
                // width: 200.sp,
                onLoaded: (p0) {
                  return CustomLoadingWidget();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
