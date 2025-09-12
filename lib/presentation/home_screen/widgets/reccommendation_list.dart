import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/pets_details/pets_details.dart';
import 'package:sizable/sizable.dart';

class RecommendationList extends StatelessWidget {
  const RecommendationList({super.key});

  final List<Map<String, String>> products = const [
    {"name": "Cute Rooster", "price": "\$12.95", "image": "assets/images/dog.jpg"},
    {"name": "Pet Carrier", "price": "\$129.95", "image": "assets/images/cat.jpg"},
    {"name": "Cat Bed", "price": "\$45.50", "image": "assets/images/bird.jpg"},
    {"name": "Dog Toy", "price": "\$9.99", "image": "assets/images/dog.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 3.w,
        mainAxisSpacing: 2.h,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, PetsDetailsPage.routeName);
          },
          child: Container(
            margin: spacing(value: 1),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.all(10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        product["image"]!,
                        // width: 150.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                10.sp.sizeh,
                Text(
                  product["name"]!,
                  style: Theme.of(context).textTheme.bodyMedium
                ),
                SizedBox(height: 0.5.h),
                Text(
                  product["price"]!,
                  style: Theme.of(context).textTheme.bodyLarge
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
