import 'dart:io';

import 'package:bloc_state_management/bloc/imagePicker/image_picker_bloc.dart';
import 'package:bloc_state_management/bloc/imagePicker/image_picker_event.dart';
import 'package:bloc_state_management/bloc/imagePicker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            if (state.file == null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            context
                                .read<ImagePickerBloc>()
                                .add(GalleryCaptureEvent());
                          },
                          icon: Image.asset(
                            "assets/images/image.png",
                            height: 60,
                            width: 60,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            context.read<ImagePickerBloc>().add(
                                  CameraCaptureEvent(),
                                );
                          },
                          icon: Image.asset(
                            "assets/images/camera.png",
                            height: 60,
                            width: 60,
                          ))
                    ],
                  ),
                ],
              );
            }
            return Image.file(
              File(state.file!.path.toString()),
              width: 300,
              height: 300,
            );
          },
        ),
      ),
    );
  }
}
