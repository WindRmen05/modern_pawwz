import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/core/theme/app_colors.dart';
import 'package:modern_pawwz/core/theme/app_theme.dart';
import 'package:sizable/sizable.dart';

class SearchAndFilterBar extends StatelessWidget {
  final void Function(String)? onSearchChanged;
  final bool? isCustomer;
  // final VoidCallback? onFilterTap;

  const SearchAndFilterBar({
    super.key,
    this.onSearchChanged,
    this.isCustomer = false,
    // this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 8,
          child: InkWell(
            onTap: () {
              // if (isCustomer == true) {
              //   Navigator.pushNamed(context, AllservicesPage.routeName,
              //       arguments: {"title": 'Search Services'});
              //   return;
              // }
              // Navigator.pushNamed(context, AlljobsPage.routeName,
              //     arguments: {"title": 'Search Services'});
            },
            child: Container(
              padding: spacing(),
              height: 60.sp,
              decoration: CustomBoxDecoration(),
              child: Row(
                children: [
                  Icon(
                    Icons.search_rounded,
                    size: 22.sp,
                    color: Colors.grey.shade600,
                  ),
                  15.sp.sizew,
                  Text(
                    "Search here....",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      // fontSize: 10.sp,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        // 10.sp.sizew,
        // Expanded(
        //   flex: 2,
        //   child: InkWell(
        //     onTap: () {
        //       // if (isCustomer == true) {
        //       //   Navigator.pushNamed(context, AllservicesPage.routeName,
        //       //       arguments: {"title": 'Filter Services'});
        //       //   return;
        //       // }
        //       // Navigator.pushNamed(context, AlljobsPage.routeName,
        //       //     arguments: {"title": 'Filter Services'});
        //     },
        //     child: Container(
        //         height: 60.sp,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           color: AppColors.darkBackground,
        //         ),
        //         child: Icon(Icons.filter_list,size: 20.sp,color: Colors.white70,)
        //         // Image.asset("assets/icons/filter.png"),
        //         ),
        //   ),
        // ),
      ],
    );
  }
}
