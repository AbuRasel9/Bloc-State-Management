import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable{
  PostEvent();

  @override
  List<Object?> get props => [];
}
class FetchPostEvent extends PostEvent{

}
class SearchItemEvent extends PostEvent{
  final String searchString;
  SearchItemEvent({required this.searchString});
  @override
  List<Object?> get props => [searchString];
}