import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/core/theme/app_theme.dart';
import 'package:sizable/sizable.dart';

class ProductBanner extends StatelessWidget {
  final List<String> banners;
  const ProductBanner({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: PageView.builder(
        itemCount: banners.length,
        controller: PageController(viewportFraction: 0.9),
        itemBuilder: (context, index) {
          return Container(
            margin: spacing(value: 2),
            decoration: CustomBoxDecoration(),
            child: Image.asset(
              banners[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
