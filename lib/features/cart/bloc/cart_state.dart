part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitialState extends CartState {}

final class CartLoadedState extends CartState {
  final List<ProductDataModel> cartItems;

  CartLoadedState({required this.cartItems});
}
