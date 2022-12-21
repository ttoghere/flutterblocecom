import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterblocecom/screens/home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/splashscreen";

  const SplashScreen({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2),
        () => Navigator.of(context).pushNamed(HomePage.routeName));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: 125,
              height: 125,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.red[900],
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Text(
              "Zero To Unicorn",
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
