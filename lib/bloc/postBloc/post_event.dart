import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable{
  PostEvent();

  @override
  List<Object?> get props => [];
}
class FetchPostEvent extends PostEvent{

}