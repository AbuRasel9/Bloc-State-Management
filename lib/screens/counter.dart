import 'package:flutter/material.dart';

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
          const Text("counter Value 0"),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Increment",
                ),
              ),
              ElevatedButton(
                onPressed: () {},
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
