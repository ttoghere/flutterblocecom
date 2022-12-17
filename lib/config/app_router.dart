import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutterblocecom/screens/cart_screen/cart_screen.dart';
import 'package:flutterblocecom/screens/home_screen/home_screen.dart';
import 'package:flutterblocecom/screens/screens_shelf.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    log("This is route: ${settings.name}");
    switch (settings.name) {
      case HomePage.routeName:
        return HomePage.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route();
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      default:
        return errorRoute();
    }
  }

  static Route errorRoute() {
    return MaterialPageRoute(builder: (context) => const HomePage());
  }
}
