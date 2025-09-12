import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/components/custom_back_button.dart';
import 'package:modern_pawwz/presentation/components/review_widget.dart';
import 'package:modern_pawwz/presentation/product_details/provider/provider.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductDetailsNotifier>(context);

    return Scaffold(
      appBar: CustomBackButtonAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    "assets/icons/dog.png",
                    height: 300.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              // Thumbnail images
              SizedBox(
                height: 70.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: product.images.length,
                  separatorBuilder: (_, __) => SizedBox(width: 8.w),
                  itemBuilder: (_, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      "assets/icons/dog.png",
                      width: 70.w,
                      height: 70.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Title + Favorite
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(Icons.favorite_border, color: Colors.red, size: 24.sp),
                ],
              ),
              SizedBox(height: 6.h),

              // Subtitle
              Text(
                product.subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 8.h),

              // Rating
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 18.sp),
                  SizedBox(width: 4.w),
                  Text(
                    "${product.rating} ",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "(${product.reviews} Reviews)",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              // Price
              Text(
                "\$${product.price.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.h),

              // Size Options
              Text(
                "Size",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),

              Row(
                children: product.sizes.map((size) {
                  final isSelected = product.selectedSize == size;
                  return GestureDetector(
                    onTap: () => product.selectSize(size),
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 16.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: isSelected ? Colors.black : Colors.white,
                        border: Border.all(
                          color: isSelected ? Colors.black : Colors.grey,
                        ),
                      ),
                      child: Text(
                        size,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.h),

              // Description
              Text(
                "Description",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'The "DR CRZ Jacket" is a stylish and versatile piece of outerwear designed to provide both fashion and functionality. Crafted with attention to detail...',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 13.sp,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 10.h),

              // Reviews
              Text(
                "Review (${product.reviews})",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                return ReviewWidget(
                  date: "01-02-2025",
                 rating: 2,
                 reviewText: "Awesome product!!",
                 userName: "Ravi Chandran",
                 userAvatar: "",
                );
              },)
            ],
          ),
        ),
      ),
    );
  }
}
