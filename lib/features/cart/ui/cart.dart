// ignore_for_file: avoid_print
import 'package:akshit_youtube/features/cart/bloc/cart_bloc.dart';
import 'package:akshit_youtube/features/home/bloc/home_bloc.dart';
import 'package:akshit_youtube/features/home/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_tile_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key, required this.homeBloc});

  final HomeBloc homeBloc;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    print("initState");

    cartBloc.add(CartInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CartItems"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              icon: const Icon(Icons.home))
        ],
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (CartInitialState):
              return const Center(child: CircularProgressIndicator());

            case const (CartLoadedState):
              final successState = state as CartLoadedState;
              print(
                  "successState.cartItems.length : ${successState.cartItems.length}");
              return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(
                      productDataModel: successState.cartItems[index],
                      cartBloc: cartBloc,
                      homeBloc: widget.homeBloc,
                    );
                  });
            default:
          }
          return Container(
            color: Colors.red,
          );
        },
      ),
    );
  }
}
