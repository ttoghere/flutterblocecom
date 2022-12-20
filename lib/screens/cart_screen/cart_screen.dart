// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocecom/blocs/cart_bloc/cart_bloc.dart';
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
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartLoaded) {
            return Padding(
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
                          Text(state.cart.freeDeliveryString,
                              style: Theme.of(context).textTheme.headline5),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(HomePage.routeName);
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 380,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return CardProductCard(
                              product: state.cart
                                  .productQuantity(state.cart.products)
                                  .keys
                                  .elementAt(index),
                              quantity: state.cart
                                  .productQuantity(state.cart.products)
                                  .values
                                  .elementAt(index),
                            );
                          },
                          itemCount: state.cart
                              .productQuantity(state.cart.products)
                              .keys
                              .length,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "SUBTOTAL:",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Text(
                                  "\$ ${state.cart.subTotalString} ",
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
                                  "\$ ${state.cart.deliveryFeeString}",
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
                      Stack(
                        children: [
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "TOTAL:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    "\$${state.cart.totalString}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("There is a problem"),
            );
          }
        },
      ),
    );
  }
}
