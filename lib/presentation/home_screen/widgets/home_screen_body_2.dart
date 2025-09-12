import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/home_screen/home_screen.dart';
import 'package:modern_pawwz/presentation/home_screen/widgets/health_analytics.dart';
import 'package:modern_pawwz/presentation/home_screen/widgets/product_banner.dart';
import 'package:modern_pawwz/presentation/home_screen/widgets/section_title.dart';
import 'package:modern_pawwz/presentation/home_screen/widgets/service_grid.dart';
import 'package:modern_pawwz/presentation/petshop/widgets/best_selling_widget.dart';
import 'package:modern_pawwz/presentation/petshop/widgets/promo_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenNotifier>(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Pet Care Dashboard",
      //     style: Theme.of(context).textTheme.titleLarge,
      //   ),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PetHeader(petName: provider.petName),
            SizedBox(height: 20.h),
            SectionTitle(title: "Health Analytics"),
            HealthAnalytics(
              vaccinesTaken: provider.vaccinesTaken,
              vaccinesPending: provider.vaccinesPending,
              healthScore: provider.healthScore,
            ),
            SizedBox(height: 20.h),
            SectionTitle(title: "Discounts & Offers"),
            ProductBanner(banners: provider.banners),
            SizedBox(height: 20.h),

            BestSellingSection(),
            SizedBox(height: 16.sp),
            PromoSection(),
            SizedBox(height: 20.h),
            SectionTitle(title: "Our Services"),
            ServicesGrid(services: provider.services1),
          ],
        ),
      ),
    );
  }
}
