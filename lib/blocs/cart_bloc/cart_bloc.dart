import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterblocecom/model/models_shelf.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartProductStarted) {
      yield* _mapStartCartToState();
    } else if (event is CartProductAdded) {
      yield* _mapAddCartProduct(event, state);
    } else if (event is CartProductRemoved) {
      yield* _mapRemoveCartProduct(event, state);
    }
  }

  Stream<CartState> _mapStartCartToState() async* {
    yield CartLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield CartLoaded();
    } catch (error) {
      log(error.toString());
    }
  }

  Stream<CartState> _mapAddCartProduct(
      CartProductAdded event, CartState state) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)..add(event.product)));
      } catch (error) {
        log(error.toString());
      }
    }
  }

  Stream<CartState> _mapRemoveCartProduct(
      CartProductRemoved event, CartState state) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)
                  ..remove(event.product)));
      } catch (error) {
        log(error.toString());
      }
    }
  }
}
