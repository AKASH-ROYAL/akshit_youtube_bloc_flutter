import 'package:akshit_youtube/features/cart/ui/cart.dart';
import 'package:akshit_youtube/features/home/bloc/home_bloc.dart';
import 'package:akshit_youtube/features/home/ui/product_tile_widget.dart';
import 'package:akshit_youtube/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    homeBloc.add(HomeInitialEvent());
  }

  final HomeBloc homeBloc = HomeBloc();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPage) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CartPage(
                        homeBloc: homeBloc,
                      )));
        } else if (state is HomeNavigateToWishlistPage) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WishlistPage(
                        homeBloc: homeBloc,
                      )));
        } else {}
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                centerTitle: true,
                title: const Text(
                  "Akshit Grocery App",
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistNavigationEvent());
                      },
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartNavigationEvent());
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      )),
                ],
              ),
              body: _getbody(state)),
        );
      },
    );
  }

  Widget _getbody(HomeState state) {
    switch (state.runtimeType) {
      case const (HomeLoading):
        return const Center(child: CircularProgressIndicator());
      case HomeLoaded:
        final successState = state as HomeLoaded;
        return ListView.builder(
            itemCount: successState.products.length,
            itemBuilder: (context, index) {
              return ProductTileWidget(
                  productDataModel: successState.products[index],
                  homeBloc: homeBloc);
            });
      case const (HomeError):
        return const Center(child: Text('HomeError'));
      default:
        return const Center(child: Text('Home Page'));
    }
  }
}
