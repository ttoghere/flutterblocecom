import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocecom/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutterblocecom/model/models_shelf.dart';
import 'package:flutterblocecom/screens/product_screen/product_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final Size size;
  final bool isWishList;
  const ProductCard({
    Key? key,
    required this.product,
    this.isWishList = false,
    required this.size,
    this.leftPosition = 5,
    this.widthFactor = 2.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = size.width / widthFactor;
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        ProductScreen.routeName,
        arguments: product,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: 150,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 59,
              left: leftPosition + 2,
              child: Container(
                width: widthValue,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.red.withAlpha(50),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Positioned(
              top: 63,
              left: leftPosition + 7,
              child: Container(
                width: widthValue - 10,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.red[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            Text(
                              "\$${product.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            )
                          ],
                        ),
                      ),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          if (state is CartLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is CartLoaded) {
                            return Expanded(
                              flex: 1,
                              child: IconButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartProductAdded(product));
                                },
                                icon: const Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          } else {
                            return Text("Something Went wrong");
                          }
                        },
                      ),
                      isWishList
                          ? Expanded(
                              flex: 1,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.remove_circle,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
