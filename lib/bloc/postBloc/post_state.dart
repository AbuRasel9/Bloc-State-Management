import 'package:bloc_state_management/model/post_model.dart';
import 'package:bloc_state_management/utils/enum.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  PostState(
      {this.postStatus = PostStatus.loding,
      this.postList = const [],
      this.message = ""});

  PostState copyWith(
      {PostStatus? postStatus, List<PostModel>? postList, String? message}) {
    return PostState(
      message: message ?? this.message,
      postList: postList ?? this.postList,
      postStatus: postStatus ?? this.postStatus,
    );
  }

  @override
  List<Object?> get props => [
        message,
        postStatus,
        postList,
      ];
}
