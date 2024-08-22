import 'dart:async';

import 'package:akshit_youtube/data/cart_items.dart';
import 'package:akshit_youtube/data/grocery_data.dart';
import 'package:akshit_youtube/features/model/product_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartInitialEvent>(cartInitialEvent);
    // on<CartRemoveEvent>(cartRemoveEvent);
    on<CartUpdateEvent>(cartUpdateEvent);
    on<CartWishlistEvent>(cartWishlistEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartInitialState());

    print("CartInitialEvent triggered");
    await Future.delayed(const Duration(seconds: 2));

    cartItems = groceryProducts.where((e) => e.itemCarted).toList();

    emit(CartLoadedState(cartItems: cartItems));
  }

  FutureOr<void> cartUpdateEvent(
      CartUpdateEvent event, Emitter<CartState> emit) {
    print("Cart update Event ");
    groceryProducts.firstWhere((e) => e.id == event.product.id).itemCarted =
        !event.product.itemCarted;

    emit(CartLoadedState(cartItems: cartItems));
  }

  FutureOr<void> cartWishlistEvent(
      CartWishlistEvent event, Emitter<CartState> emit) {
    print("cartWishlistEvent ");
    groceryProducts.firstWhere((e) => e.id == event.product.id).itemWishlisted =
        !event.product.itemWishlisted;
    emit(CartLoadedState(cartItems: cartItems));
  }
}
