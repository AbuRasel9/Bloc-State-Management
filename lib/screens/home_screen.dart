import 'package:bloc_state_management/bloc/favouriteBloc/favourite_event.dart';
import 'package:bloc_state_management/model/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/favouriteBloc/favourite_bloc.dart';
import '../bloc/favouriteBloc/favourite_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<FavouriteBloc>().add(FetchFavouriteListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<FavouriteBloc>().add(DeleteFavouriteItemEvent());
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {

            switch (state.status) {
              case ListStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurple,
                  ),
                );
              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.favouriteList.length,
                  itemBuilder: (context, index) {
                    final item = state.favouriteList[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                          value: item.isDeleting,
                          onChanged: (value) {
                            context.read<FavouriteBloc>().add(
                                  SelectFavouriteItemEvent(
                                    item: FavouriteItemModel(
                                      id: item.id,
                                      title: item.title,
                                      isDeleting: item.isDeleting ?? false
                                          ? false
                                          : true,
                                      isFavourite: item.isFavourite ?? false
                                          ? true
                                          : false,
                                    ),
                                  ),
                                );
                          },
                        ),
                        title: Text(item.title),
                        trailing: IconButton(
                          onPressed: () {
                            context.read<FavouriteBloc>().add(
                                  FavouriteItemEvent(
                                    item: FavouriteItemModel(
                                      id: item.id,
                                      title: item.title,
                                      isFavourite: item.isFavourite ?? false
                                          ? false
                                          : true,
                                      isDeleting:    item.isDeleting ?? false
                                      ? true
                                      : false,
                                    ),
                                  ),
                                );
                          },
                          icon: Icon(
                            item.isFavourite ?? false
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                        ),
                      ),
                    );
                  },
                );

              case ListStatus.error:
                return const Center(
                  child: Text("Something went to wrong"),
                );
            }
          },
        ),
      ),
    );
  }
}
