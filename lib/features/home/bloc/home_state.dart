part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<ProductDataModel> products;

  HomeLoaded({required this.products});
}

final class HomeError extends HomeState {}

final class HomeNavigateToWishlistPage extends HomeActionState {}

final class HomeNavigateToCartPage extends HomeActionState {}

final class HomeProductItemWishListedItemState extends HomeState {}

final class HomeProductItemCartedItemState extends HomeActionState {}

final class HomeProductUpdated extends HomeActionState {}
