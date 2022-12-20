import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocecom/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:flutterblocecom/screens/home_screen/widgets/widgets_shelf.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Wishlist",
      ),
      bottomNavigationBar: const CustomBottomAppbar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WishListLoaded) {
            return GridView.builder(
              itemCount: state.wishlist.products.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 3,
                vertical: 16,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.2,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: state.wishlist.products[index],
                  size: size,
                  widthFactor: 1.5,
                  leftPosition: 120,
                  isWishList: true,
                );
              },
            );
          } else {
            return const Center(
              child: Text("Something is wrong"),
            );
          }
        },
      ),
    );
  }
}
