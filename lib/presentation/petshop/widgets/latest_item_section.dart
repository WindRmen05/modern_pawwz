// Latest Items Section
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_pawwz/presentation/components/custom_header_widget.dart';
import 'package:modern_pawwz/presentation/petshop/petshop.dart';
import 'package:modern_pawwz/presentation/product_details/view/product_details_page.dart';

class LatestItemsSection extends StatelessWidget {
  const LatestItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<PetShopNotifier>(context).latestItems;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderWidget("Out Latest Products",
            // subtitles: "Healthy food",
            isSeeAll: true,
            onTap: () {}),
        SizedBox(height: 12.sp),
        Column(
          children: products
              .map((product) => LatestItemCard(product: product))
              .toList(),
        )
      ],
    );
  }
}

// Latest Item Card
class LatestItemCard extends StatelessWidget {
  final Product product;
  const LatestItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsPage.routeName);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.sp),
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                  width: 60.sp,
                  height: 60.sp,
                  // color: Colors.grey[300],
                ),
              ),
              SizedBox(width: 12.sp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                        style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(height: 4.sp),
                    Text("\$${product.price}",
                        style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(height: 4.sp),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 14.sp),
                        SizedBox(width: 4.sp),
                        Text("${product.rating}",
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    )
                  ],
                ),
              ),
              Icon(Icons.add_shopping_cart, color: Colors.orange, size: 24.sp)
            ],
          ),
        ),
      ),
    );
  }
}
