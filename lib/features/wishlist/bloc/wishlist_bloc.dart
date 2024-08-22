import 'dart:async';

import 'package:akshit_youtube/data/grocery_data.dart';
import 'package:akshit_youtube/data/wishlist_items.dart';
import 'package:akshit_youtube/features/model/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitialState()) {
    on<LoadWishlistEvent>(loadWishlistEvent);
    on<WishlistUpdateEvent>(wishlistUpdateEvent);
    on<WishlistCartUpdateEvent>(wishlistCartUpdateEvent);
  }

  Future<FutureOr<void>> loadWishlistEvent(LoadWishlistEvent event,
      Emitter<WishlistState> emit) async {
    print("loadWishlistEvent");
    emit(WishlistInitialState());
    await Future.delayed(const Duration(seconds: 2));
    // assigning wishlistItems a mutableList
    wishlistItems = groceryProducts.where((e) => e.itemWishlisted).toList();
    emit(WishlistLoadedState(products: wishlistItems));
  }

  FutureOr<void> wishlistUpdateEvent(WishlistUpdateEvent event,
      Emitter<WishlistState> emit) {
    print("WishlistUpdateEvent");

    wishlistItems
        .firstWhere((e) => e.id == event.product.id)
        .itemWishlisted =
    !event.product.itemWishlisted;
    emit(WishlistLoadedState(products: wishlistItems));
  }

  FutureOr<void> wishlistCartUpdateEvent(WishlistCartUpdateEvent event,
      Emitter<WishlistState> emit) {
    print("cartUpdateEvent");
    wishlistItems
        .firstWhere((e) => e.id == event.product.id)
        .itemCarted =
    !event.product.itemCarted;
    emit(WishlistLoadedState(products: wishlistItems));
  }
}
