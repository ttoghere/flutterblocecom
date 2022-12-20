import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocecom/model/models_shelf.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishListLoading());

  Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
    if (event is StartWishlist) {
      yield* _mapStartWishlistToState();
    } else if (event is AddWishlistProduct) {
      yield* _mapAddWishlistProduct(event, state);
    } else if (event is RemoveWishlistProduct) {
      yield* _mapRemoveWishlistProduct(event, state);
    }
  }

  Stream<WishlistState> _mapStartWishlistToState() async* {
    yield WishListLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const WishListLoaded();
    } catch (error) {
      log(error.toString());
    }
  }

  Stream<WishlistState> _mapAddWishlistProduct(
      AddWishlistProduct event, WishlistState state) async* {
    if (state is WishListLoaded) {
      try {
        yield WishListLoaded(
          wishlist: Wishlist(
              products: List.from(state.wishlist.products)..add(event.product)),
        );
      } catch (error) {
        log(error.toString());
      }
    }
  }

  Stream<WishlistState> _mapRemoveWishlistProduct(
      RemoveWishlistProduct event, WishlistState state) async* {
    if (state is WishListLoaded) {
      try {
        yield WishListLoaded(
          wishlist: Wishlist(
              products: List.from(state.wishlist.products)
                ..remove(event.product)),
        );
      } catch (error) {
        log(error.toString());
      }
    }
  }
}
