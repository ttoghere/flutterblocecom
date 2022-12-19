// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWishlist extends WishlistEvent {}

class AddWishlistProduct extends WishlistEvent {
  final Product product;
  AddWishlistProduct(
    this.product,
  );

  @override
  List<Object> get props => [product];
}

class RemoveWishlistProduct extends WishlistEvent {
  final Product product;
  RemoveWishlistProduct(
    this.product,
  );

  @override
  List<Object> get props => [product];
}
