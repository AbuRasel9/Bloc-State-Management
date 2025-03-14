import 'package:bloc_state_management/bloc/postBloc/post_event.dart';
import 'package:bloc_state_management/bloc/postBloc/post_state.dart';
import 'package:bloc_state_management/model/post_model.dart';
import 'package:bloc_state_management/repository/post_repository.dart';
import 'package:bloc_state_management/utils/enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository postRepository = PostRepository();

  PostBloc(this.postRepository) : super(PostState()) {
    on<FetchPostEvent>(_fetchDataApi);
    on<SearchItemEvent>(_searchItem);
  }

  //create variable for store search all data
  List<PostModel>? tempPostList = [];

  Future<void> _fetchDataApi(
      FetchPostEvent event, Emitter<PostState> emit) async {
    await postRepository.fetchPostList().then(
      (value) {
        emit(state.copyWith(
            postStatus: PostStatus.success,
            message: "Success",
            postList: value));
      },
    ).onError(
      (error, stackTrace) {
        print("error  $error");
        print("line no $stackTrace");
        emit(state.copyWith(
            postStatus: PostStatus.error, message: error.toString()));
      },
    );
  }

  void _searchItem(SearchItemEvent event, Emitter<PostState> emit) {
    //if search string empty than set post list empty
    if (event.searchString.isEmpty) {
      state.copyWith(tempPostList: [], message: "");
    } else {
      //if search string not empty and list is empty than show this message
      tempPostList = state.postList.where(
        (element) {
          final name = element.name?.toLowerCase() ?? "";
          final id = element.id?.toString().toLowerCase() ?? "";
          return name.startsWith(event.searchString.toLowerCase()) ||
              id.contains(event.searchString.toLowerCase());
        },
      ).toList();
      if (state.tempPostList.isEmpty) {
        emit(state.copyWith(tempPostList:tempPostList,searchEmptyMessage: "No Data Found"));
      } else {
        emit(
          state.copyWith(tempPostList: tempPostList, searchEmptyMessage: ""),
        );
      }
    }
  }
}
