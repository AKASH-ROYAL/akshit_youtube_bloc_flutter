part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

abstract class WishlistActionState extends WishlistState {
}

final class WishlistInitialState extends WishlistState {
}

final class WishlistLoadedState extends WishlistState {

  final List<ProductDataModel> products;

  WishlistLoadedState({required this.products});

}