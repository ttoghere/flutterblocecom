import 'package:flutter/material.dart';
import 'package:flutterblocecom/screens/shared/shared_shelf.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/";
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const HomePage(),
        settings: const RouteSettings(name: routeName));
  }

  const HomePage({Key? key}) : super(key: key);

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
