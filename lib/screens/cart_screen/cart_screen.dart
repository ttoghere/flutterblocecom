import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Cart Screen",
      ),
      bottomNavigationBar: const CustomBottomAppbar(),
    );
  }
}
