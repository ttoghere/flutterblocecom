// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutterblocecom/model/models_shelf.dart';
import 'package:flutterblocecom/screens/home_screen/widgets/widgets_shelf.dart';
import 'package:flutterblocecom/screens/shared/shared_shelf.dart';

class CatalogScreen extends StatelessWidget {
  static const routeName = "/catalogscreen";
  static Route route({required Category category}) {
    return MaterialPageRoute(
        builder: (context) => CatalogScreen(category: category),
        settings: const RouteSettings(name: routeName));
  }

  final Category category;

  const CatalogScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      bottomNavigationBar: const CustomBottomAppbar(),
      body: GridView.builder(
        itemCount: categoryProducts.length,
        padding: const EdgeInsets.symmetric(
          horizontal: 3,
          vertical: 16,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 1.3,
        ),
        itemBuilder: (context, index) {
          return Center(
            child: ProductCard(
              leftPosition: 10,
              product: categoryProducts[index],
              size: size,
              widthFactor: 2.2,
            ),
          );
        },
      ),
    );
  }
}
//ProductCard(product: Product.products[0], size: size),