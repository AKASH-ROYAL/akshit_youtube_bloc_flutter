import 'package:akshit_youtube/features/cart/bloc/cart_bloc.dart';
import 'package:akshit_youtube/features/home/bloc/home_bloc.dart';
import 'package:akshit_youtube/features/model/product_model.dart';
import 'package:flutter/material.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  final HomeBloc homeBloc;

  const CartTileWidget(
      {super.key,
      required this.productDataModel,
      required this.cartBloc,
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
                        cartBloc
                            .add(CartWishlistEvent(product: productDataModel));
                        homeBloc.add(HomeProductUpdatedEvent());
                      },
                      icon: Icon(productDataModel.itemWishlisted
                          ? Icons.favorite
                          : Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        cartBloc
                            .add(CartUpdateEvent(product: productDataModel));
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
