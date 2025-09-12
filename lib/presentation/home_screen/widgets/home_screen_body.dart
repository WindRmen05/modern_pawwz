import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/components/custom_search_filter_widget.dart';
import 'package:modern_pawwz/presentation/components/searchBarWidget.dart';
import 'package:modern_pawwz/presentation/home_screen/provider/provider.dart';
import 'package:modern_pawwz/presentation/home_screen/widgets/banner_slider.dart';
import 'package:modern_pawwz/presentation/home_screen/widgets/category_list_widget.dart';
import 'package:modern_pawwz/presentation/home_screen/widgets/reccommendation_list.dart';
import 'package:sizable/sizable.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenNotifier>(
      builder: (context, state, child) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.sp.sizeh,
                  Padding(
                    padding: spacingSym(v: 0),
                    child: const SearchAndFilterBar(),
                  ),
                  20.sp.sizeh,

                  // Categories
                  const CategoryList(),
                  20.sp.sizeh,

                  // Banner Slider
                  const BannerSlider(),
                  20.sp.sizeh,

                  // Recommendation Title
                  Padding(
                    padding: spacingSym(v: 0),
                    child: Text(
                      "Recommendation",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  20.sp.sizeh,

                  // Recommendation Grid
                  Padding(
                    padding: spacingSym(v: 0,h:5),
                    child: RecommendationList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
