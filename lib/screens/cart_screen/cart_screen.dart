// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutterblocecom/model/models_shelf.dart';
import 'package:flutterblocecom/screens/cart_screen/widgets/widgets_shelf.dart';
import 'package:flutterblocecom/screens/home_screen/home_screen.dart';
import 'package:flutterblocecom/screens/shared/shared_shelf.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cartscreen";
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const CartScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Cart",
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red[900],
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text(
                  "Go To Checkout",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add \$20.0 for free delivery",
                        style: Theme.of(context).textTheme.headline5),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(HomePage.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        "Add More Items",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CardProductCard(
                  product: Product.products[0],
                ),
                CardProductCard(
                  product: Product.products[2],
                ),
                CardProductCard(
                  product: Product.products[1],
                ),
              ],
            ),
            Column(
              children: [
                const Divider(
                  thickness: 2,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SUBTOTAL: ",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            "\$5.98",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "DELIVERY FEE: ",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            "\$5.98",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                Stack(children: [
                  Container(
                    width: size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.red.withAlpha(50),
                    ),
                  ),
                  Container(
                    width: size.width,
                    margin: const EdgeInsets.all(5),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red[900]!,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TOTAL:",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            "\$255.98",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
