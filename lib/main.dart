import 'package:bloc_state_management/bloc/favouriteBloc/favourite_bloc.dart';
import 'package:bloc_state_management/repository/favourite_repository.dart';
import 'package:bloc_state_management/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavouriteBloc(FavouriteRepository()),),

      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
