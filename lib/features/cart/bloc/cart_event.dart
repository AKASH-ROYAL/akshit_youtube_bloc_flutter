part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartUpdateEvent extends CartEvent {
  final ProductDataModel product;

  CartUpdateEvent({required this.product});
}

class CartWishlistEvent extends CartEvent {
  final ProductDataModel product;

  CartWishlistEvent({required this.product});
}
