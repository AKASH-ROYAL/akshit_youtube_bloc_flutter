part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeCartButtonClickedEvent({required this.clickedProduct});
}

class HomeCartNavigationEvent extends HomeEvent {}

class HomeWishlistNavigationEvent extends HomeEvent {}

class HomeProductUpdatedEvent extends HomeEvent {}
