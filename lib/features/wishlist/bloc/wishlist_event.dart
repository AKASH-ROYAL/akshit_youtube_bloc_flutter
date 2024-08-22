part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

final class LoadWishlistEvent extends WishlistEvent {}

final class RemoveWishlistEvent extends WishlistEvent {}

final class WishlistUpdateEvent extends WishlistEvent {
  final ProductDataModel product;

  WishlistUpdateEvent({required this.product});
}

final class WishlistCartUpdateEvent extends WishlistEvent {
  final ProductDataModel product;

  WishlistCartUpdateEvent({required this.product});
}
