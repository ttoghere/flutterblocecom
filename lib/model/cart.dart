import 'package:equatable/equatable.dart';
import 'package:flutterblocecom/model/models_shelf.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  double get subTotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subTotal) {
    if (subTotal >= 30) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  double total(subTotal, deliveryFee) {
    return subTotal + deliveryFee(subTotal);
  }

  String freeDelivery(subTotal) {
    if (subTotal >= 30.0) {
      return "You have Free Delivery";
    } else {
      String missing = (30.0 - subTotal).toStringAsFixed(2);
      return "Add \$$missing for free delivery";
    }
  }

  Map productQuantity(List<Product> products) {
    var quantity = Map();
    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  String get totalString => total(subTotal, deliveryFee).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subTotal);
  String get subTotalString => subTotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subTotal).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
