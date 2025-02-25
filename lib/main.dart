import 'package:bloc_state_management/bloc/counter/counter_bloc.dart';
import 'package:bloc_state_management/screens/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        home: CounterApp(),
      ),
    );
  }
}
