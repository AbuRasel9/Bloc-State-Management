import 'package:bloc_state_management/bloc/postBloc/post_event.dart';
import 'package:bloc_state_management/bloc/postBloc/post_state.dart';
import 'package:bloc_state_management/model/post_model.dart';
import 'package:bloc_state_management/repository/post_repository.dart';
import 'package:bloc_state_management/utils/enum.dart';
import 'package:bloc_state_management/utils/search.dart';
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
        emit(
          state.copyWith(
            postStatus: PostStatus.success,
            message: "Success",
            postList: value,
            tempPostList: value,
          ),
        );
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
      state.copyWith(tempPostList: state.postList);
    } else {
      tempPostList = Search.find(items: state.postList, q: event.searchString);
      state.copyWith(
        tempPostList: tempPostList,
      );
    }
  }
}
