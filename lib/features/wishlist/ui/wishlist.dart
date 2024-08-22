import 'package:akshit_youtube/features/home/bloc/home_bloc.dart';
import 'package:akshit_youtube/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:akshit_youtube/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key, required this.homeBloc});

  final HomeBloc homeBloc;

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    wishlistBloc.add(LoadWishlistEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist Items"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistInitialState:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case WishlistLoadedState:
              final successState = state as WishlistLoadedState;
              return ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return WishlistTileWidget(
                        productDataModel: successState.products[index],
                        wishlistBloc: wishlistBloc,
                        homeBloc: widget.homeBloc);
                  });
          }
          return Container();
        },
      ),
    );
  }
}
