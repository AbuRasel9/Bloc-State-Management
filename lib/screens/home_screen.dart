import 'dart:convert';

import 'package:bloc_state_management/bloc/postBloc/post_bloc.dart';
import 'package:bloc_state_management/bloc/postBloc/post_event.dart';
import 'package:bloc_state_management/bloc/postBloc/post_state.dart';
import 'package:bloc_state_management/model/post_model.dart';
import 'package:bloc_state_management/repository/post_repository.dart';
import 'package:bloc_state_management/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel>data=[];
  getData() async {
    data=await PostRepository().fetchPostList();
    setState(() {

    });

  }
  @override
  void initState() {
    context.read<PostBloc>().add(FetchPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Padding(padding: const EdgeInsets.all(16),

      child: BlocBuilder<PostBloc,PostState>(builder: (context, state) {
        switch (state.postStatus){
          case PostStatus.loding:
            return const Center(child: CircularProgressIndicator(),);
          case PostStatus.success:
            return Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    context.read<PostBloc>().add(SearchItemEvent(searchString: value));
                  },
                  decoration: const InputDecoration(
                    hintText: "Search id or name",
                    border: OutlineInputBorder()
                  ),
                ),
                Expanded(
                  child:state.searchEmptyMessage.isNotEmpty?Center(
                    child: Text(state.searchEmptyMessage,style: const TextStyle(
                      fontSize: 22,fontWeight: FontWeight.bold,
                    ),),
                  ): ListView.builder(
                    itemCount:state.tempPostList.isEmpty? state.postList.length:state.tempPostList.length,
                    itemBuilder: (context, index) {
                    final item=state.tempPostList.isEmpty? state.postList[index]: state.tempPostList[index];
                    return  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListTile(
                        title: Text(item.name ?? ""),
                        subtitle: Text(item.body ?? ""),
                        leading: Text(item.id?.toString() ?? ""),
                        trailing: Text(item.postId?.toString() ?? ""),

                      ),
                    );
                  },),
                ),
              ],
            );
          default:
            return const SizedBox();
        }

      },),
      ),
    );
  }
}
