import 'package:flutter/material.dart';
import 'package:modern_pawwz/presentation/product_details/provider/provider.dart';
import 'package:modern_pawwz/presentation/product_details/widgets/product_details_body.dart';

class ProductDetailsPage extends StatelessWidget {
  static const String routeName = "ProductDetailsPage";
  const ProductDetailsPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ProductDetailsPage());
  }
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDetailsNotifier(),
      child: const Scaffold(
        body: ProductDetailsView(),
      ),
    );
  }   
}

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProductDetailsBody();
  }
}
