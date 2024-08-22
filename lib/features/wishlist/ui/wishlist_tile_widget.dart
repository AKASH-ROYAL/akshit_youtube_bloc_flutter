import 'package:akshit_youtube/features/home/bloc/home_bloc.dart';
import 'package:akshit_youtube/features/model/product_model.dart';
import 'package:akshit_youtube/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  final HomeBloc homeBloc;

  const WishlistTileWidget({super.key,
    required this.productDataModel,
    required this.wishlistBloc,
    required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          const SizedBox(height: 20),
          Text(productDataModel.name,
              style:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(productDataModel.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${productDataModel.price}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        wishlistBloc.add(
                            WishlistUpdateEvent(product: productDataModel));
                        homeBloc.add(HomeProductUpdatedEvent());
                      },
                      icon: Icon(productDataModel.itemWishlisted
                          ? Icons.favorite
                          : Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        wishlistBloc.add(
                            WishlistCartUpdateEvent(product: productDataModel));
                        homeBloc.add(HomeProductUpdatedEvent());
                      },
                      icon: Icon(productDataModel.itemCarted
                          ? Icons.shopping_bag
                          : Icons.shopping_bag_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
