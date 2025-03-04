import 'package:bloc_state_management/bloc/counter/counter_bloc.dart';
import 'package:bloc_state_management/bloc/switch/switch_bloc.dart';
import 'package:bloc_state_management/bloc/switch/switch_event.dart';
import 'package:bloc_state_management/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch and slider"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const Text(
                  "Notification",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                BlocBuilder<SwitchBloc, SwitchState>(
                  builder: (context, state) {
                    return Switch(
                      value: state.switchValue,
                      onChanged: (value) {
                        context.read<SwitchBloc>().add(
                              SwitchOnOffEvent(
                                switchValue: value,
                              ),
                            );
                      },
                    );
                  },
                )
              ],
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              //when switch button click than build this widget
              buildWhen: (previous, current) => previous.switchValue!=current.switchValue,
              builder: (context, state) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.red.withOpacity(state.sliderValue),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(

              //when slider  click than build this widget
              buildWhen: (previous, current) => previous.sliderValue!=current.sliderValue,
              builder: (context, state) {
                return Slider(
                  value: state.sliderValue,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(SliderIncrementDecrementEvent(sliderValue: value));
                    
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
