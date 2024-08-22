import 'dart:async';

import 'package:akshit_youtube/data/grocery_data.dart';
import 'package:akshit_youtube/features/model/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonClickedEvent>(homeWishlistButtonClickedEvent);
    on<HomeCartButtonClickedEvent>(homeCartButtonClickedEvent);
    on<HomeCartNavigationEvent>(homeCartNavigationEvent);
    on<HomeWishlistNavigationEvent>(homeWishlistNavigationEvent);
    on<HomeProductUpdatedEvent>(homeProductUpdatedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    await Future.delayed(const Duration(seconds: 2));
    groceryProducts = groceryJsonData
        .map((e) => ProductDataModel(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            price: e['price'],
            imageUrl: e['imageUrl']))
        .toList();
    emit(HomeLoaded(products: groceryProducts));
  }

  FutureOr<void> homeWishlistButtonClickedEvent(
      HomeWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist Button Created");
    // var clickedprooduct = event.clickedProduct;
    // clickedprooduct.itemWishlisted = !clickedprooduct.itemWishlisted;

    // if (clickedprooduct.itemWishlisted) {
    //   wishlistItems.add(clickedprooduct);
    // } else {
    //   wishlistItems.remove(clickedprooduct);
    // }
    groceryProducts
        .firstWhere((e) => e.id == event.clickedProduct.id)
        .itemWishlisted = !event.clickedProduct.itemWishlisted;

    emit(HomeProductItemWishListedItemState());
    emit(HomeLoaded(products: groceryProducts));
  }

  FutureOr<void> homeCartButtonClickedEvent(
      HomeCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("homeCartButtonClickedEvent");
    print(" event.clickedProduct.id :${event.clickedProduct.itemCarted}");
    // var clickedProduct = event.clickedProduct;
    // clickedProduct.itemCarted = !clickedProduct.itemCarted;
    // if (clickedProduct.itemCarted) {
    //   cartItems.add(clickedProduct);
    // } else {
    //   cartItems.remove(clickedProduct);
    // }
    // print("cartItems.length : ${cartItems.length}");
    groceryProducts
        .firstWhere((e) => e.id == event.clickedProduct.id)
        .itemCarted = !event.clickedProduct.itemCarted;

    emit(HomeProductItemCartedItemState());
    emit(HomeLoaded(products: groceryProducts));
  }

  FutureOr<void> homeWishlistNavigationEvent(
      HomeWishlistNavigationEvent event, Emitter<HomeState> emit) {
    print("homeWishlistNavigationEvent ");
    emit(HomeNavigateToWishlistPage());
  }

  FutureOr<void> homeCartNavigationEvent(
      HomeCartNavigationEvent event, Emitter<HomeState> emit) {
    print("homeCartNavigationEvent");
    emit(HomeNavigateToCartPage());
  }

  FutureOr<void> homeProductUpdatedEvent(
      HomeProductUpdatedEvent event, Emitter<HomeState> emit) {
    print("homeProductUpdatedEvent");
    emit(HomeLoaded(products: groceryProducts));
  }
}
