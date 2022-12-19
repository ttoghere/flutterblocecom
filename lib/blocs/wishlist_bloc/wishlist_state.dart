// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

class WishListLoading extends WishlistState {}

class WishListLoaded extends WishlistState {
  final Wishlist wishlist;
  WishListLoaded({
    this.wishlist = const Wishlist(),
  });
  @override
  List<Object> get props => [wishlist];
}

class WishListError extends WishlistState {}
