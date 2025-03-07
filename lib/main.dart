import 'package:bloc_state_management/bloc/toDoBloc/to_do_bloc.dart';
import 'package:bloc_state_management/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';
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
        BlocProvider(create: (context) => ToDoBloc(),),

      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
