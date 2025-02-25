import 'package:bloc_state_management/bloc/counter/counter_bloc.dart';
import 'package:bloc_state_management/bloc/counter/counter_event.dart';
import 'package:bloc_state_management/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter app"),
      ),
      body: Column(
        children: <Widget>[
          BlocBuilder<CounterBloc,CounterState>(builder: (context, state){
            return  Text("counter Value ${state.counter}");

          },),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter());
                },
                child: const Text(
                  "Increment",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter());

                },
                child: const Text(
                  "Decrement",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
