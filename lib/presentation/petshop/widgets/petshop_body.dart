import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/components/custom_back_button.dart';
import 'package:modern_pawwz/presentation/components/custom_selection_list.dart';
import 'package:modern_pawwz/presentation/petshop/provider/petshop_provider.dart';
import 'package:modern_pawwz/presentation/petshop/widgets/best_selling_widget.dart';
import 'package:modern_pawwz/presentation/petshop/widgets/free_delivery_section.dart';
import 'package:modern_pawwz/presentation/petshop/widgets/latest_item_section.dart';
import 'package:modern_pawwz/presentation/petshop/widgets/promo_widget.dart';
import 'package:provider/provider.dart';

class PetShopBody extends StatelessWidget {
  const PetShopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PetShopNotifier>(
      builder: (context, value,_) {
        return Scaffold(
          appBar: CustomBackButtonAppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
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
                  CustomSelectionList(
                    items: value.categoryList,
                    onSelected: (p0) {
            
                    },
                  ),
                  SizedBox(height: 16.sp),
                  LatestItemsSection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
