import 'package:flutter/material.dart';
import 'package:flutterblocecom/screens/shared/shared_shelf.dart';

class CatalogScreen extends StatelessWidget {
  static const routeName = "/catalogscreen";
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const CatalogScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const CatalogScreen({Key? key}) : super(key: key);

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
