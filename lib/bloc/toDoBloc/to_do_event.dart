import 'package:equatable/equatable.dart';

abstract class ToDoEvent extends Equatable{
  const ToDoEvent();
  @override
  List<Object?> get props => [];
}
class ToDoAddEvent extends ToDoEvent{
  final int value;
  const ToDoAddEvent({required this.value});
  @override
  List<Object?> get props => [value];


}
class ToDoDeleteEvent extends ToDoEvent{
  final int index;
  const ToDoDeleteEvent({required this.index});
  @override
  List<Object?> get props => [];
}