import 'package:bloc_state_management/model/post_model.dart';
import 'package:bloc_state_management/utils/enum.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> tempPostList;
  final String message;

  //search data message when search string no empty and searchList is empty than show this message in screen
  final String searchEmptyMessage;

  PostState(
      {this.postStatus = PostStatus.loding,
      this.postList = const [],
      this.message = "",
      this.tempPostList = const [],
      this.searchEmptyMessage = ""});

  PostState copyWith({
    PostStatus? postStatus,
    List<PostModel>? postList,
    String? message,
    List<PostModel>? tempPostList,
    String? searchEmptyMessage,
  }) {
    return PostState(
      message: message ?? this.message,
      postList: postList ?? this.postList,
      postStatus: postStatus ?? this.postStatus,
      tempPostList: tempPostList ?? this.tempPostList,
      searchEmptyMessage: searchEmptyMessage ?? this.searchEmptyMessage,
    );
  }

  @override
  List<Object?> get props => [
        message,
        postStatus,
        postList,
        tempPostList,
    searchEmptyMessage
      ];
}
