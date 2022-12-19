// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocecom/blocs/wishlist_bloc/wishlist_bloc.dart';

import 'package:flutterblocecom/model/product.dart';
import 'package:flutterblocecom/screens/home_screen/widgets/widgets_shelf.dart';
import 'package:flutterblocecom/screens/shared/shared_shelf.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = "/productscreen";
  static Route route({required Product product}) {
    return MaterialPageRoute(
        builder: (context) => ProductScreen(product: product),
        settings: const RouteSettings(name: routeName));
  }

  final Product product;
  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: product.name,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red[900],
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text(
                  "Add To Cart",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context
                          .read<WishlistBloc>()
                          .add(AddWishlistProduct(product));
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Added to your wishlist")));
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.9,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: [
              HeroCarouselCard(
                product: product,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.red.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: size.width - 18,
                  height: 50,
                  color: Colors.red[900],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      Text(
                        "\$${product.price}",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                "Product Information:",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.red[900]),
              ),
              children: [
                ListTile(
                  title: Text(
                    "Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                "Delivery Information:",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.red[900]),
              ),
              children: [
                ListTile(
                  title: Text(
                    "Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni -- Tanıtım Metni",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
