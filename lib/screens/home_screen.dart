import 'package:bloc_state_management/bloc/toDoBloc/to_do_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/toDoBloc/to_do_bloc.dart';
import '../bloc/toDoBloc/to_do_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<ToDoBloc, ToDoState>(
          builder: (context, state) {
            print("---${state.toDoList.isEmpty}");
            if (state.toDoList.isEmpty) {
              return const Center(
                child: Text("No list found", style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold,),),
              );
            } else if (state.toDoList.isNotEmpty) {
              return ListView.builder(
                itemCount: state.toDoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("task ${state.toDoList[index]}"),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<ToDoBloc>().add(
                            ToDoDeleteEvent(index: index));
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      floatingActionButton: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              final lastValue = state.toDoList.isEmpty ? 0 : state.toDoList
                  .last;
              context.read<ToDoBloc>().add(ToDoAddEvent(value: lastValue + 1));
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
