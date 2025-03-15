import 'package:bloc_state_management/bloc/login_bloc/login_bloc.dart';
import 'package:bloc_state_management/bloc/postBloc/post_bloc.dart';
import 'package:bloc_state_management/repository/auth_repository.dart';
import 'package:bloc_state_management/repository/post_repository.dart';
import 'package:bloc_state_management/screens/authScreen/login_screen.dart';
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
          BlocProvider(
            create: (context) => PostBloc(PostRepository()),
          ),
          BlocProvider(
            create: (context) => LoginBloc(
              AuthRepository(),
            ),
          )
        ],
        child: MaterialApp(
          home: LoginScreen(),
        ));
  }
}
