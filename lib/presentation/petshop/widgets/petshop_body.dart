import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/petshop/widgets/best_selling_widget.dart';
import 'package:modern_pawwz/presentation/petshop/widgets/free_delivery_section.dart';
import 'package:modern_pawwz/presentation/petshop/widgets/latest_item_section.dart';
import 'package:modern_pawwz/presentation/petshop/widgets/promo_widget.dart';


class PetShopBody extends StatelessWidget {
  const PetShopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BestSellingSection(),
            SizedBox(height: 16.sp),
            PromoSection(),
            SizedBox(height: 16.sp),
            FreeDeliverySection(),
            SizedBox(height: 16.sp),
            LatestItemsSection(),
          ],
        ),
      ),
    );
  }
}
