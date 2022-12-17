// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutterblocecom/screens/screens_shelf.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        decoration: BoxDecoration(
          color: Colors.red[900],
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white)),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(WishlistScreen.routeName);
          },
          icon: const Icon(
            Icons.favorite,
            size: 25,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(200, 50);
}
