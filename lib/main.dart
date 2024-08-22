import 'package:akshit_youtube/features/cart/bloc/cart_bloc.dart';
import 'package:akshit_youtube/features/home/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/bloc/home_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: MultiBlocProvider(providers: [
      BlocProvider(create: (context) => HomeBloc()),
      BlocProvider(create: (context) => CartBloc()),
    ], child: const Home()),
    debugShowCheckedModeBanner: false,
  ));
}
