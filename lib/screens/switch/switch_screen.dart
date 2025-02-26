import 'package:flutter/material.dart';

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
        title: Text("Switch and slider"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Notification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              Switch(
                value: true,
                onChanged: (value) {},
              ),
            ],

          ),
          SizedBox(height: 10,),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.red,
          ),
          Slider(value: 1, onChanged: (value) {

          },),
        ],
      ),

    );
  }
}
