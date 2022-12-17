import 'package:flutter/material.dart';
import 'package:flutterblocecom/screens/shared/shared_shelf.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = "/wishlistscreen";
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const WishlistScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Home Page",
      ),
      bottomNavigationBar: const CustomBottomAppbar(),
    );
  }
}
