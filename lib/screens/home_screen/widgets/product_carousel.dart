import 'package:flutter/material.dart';
import 'package:flutterblocecom/model/models_shelf.dart';
import 'package:flutterblocecom/screens/home_screen/widgets/widgets_shelf.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({
    Key? key,
    required this.size,
    required this.products,
  }) : super(key: key);
  final List<Product> products;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 170,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ProductCard(
                product: products[index],
                size: size,
                widthFactor: 2.3,
              ),
            );
          },
          itemCount: products.length,
        ));
  }
}
