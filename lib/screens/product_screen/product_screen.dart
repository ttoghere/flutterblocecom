import 'package:flutter/material.dart';
import 'package:flutterblocecom/screens/shared/shared_shelf.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = "/productscreen";
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const ProductScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const ProductScreen({Key? key}) : super(key: key);

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
