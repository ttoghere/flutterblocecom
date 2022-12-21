// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocecom/blocs/blocs.dart';

import 'package:flutterblocecom/model/models_shelf.dart';
import 'package:flutterblocecom/screens/home_screen/widgets/widgets_shelf.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Home Page",
      ),
      bottomNavigationBar: const CustomBottomAppbar(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 20.0,
            ),
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 0.9,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                    ),
                    items: state.categories
                        .map((category) => HeroCarouselCard(category: category))
                        .toList(),
                  );
                } else {
                  return const Text("Something Went Wrong");
                }
              },
            ),
          ),
          const SectionTitle(
            title: "Recommended",
          ),
          ProductCarousel(
              size: size,
              products: Product.products
                  .where((element) => element.isRecommended)
                  .toList()),
          const SectionTitle(
            title: "Popular",
          ),
          ProductCarousel(
              size: size,
              products: Product.products
                  .where((element) => element.isPopular)
                  .toList()),
        ],
      ),
    );
  }
}
