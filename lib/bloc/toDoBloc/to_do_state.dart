import 'package:equatable/equatable.dart';

class ToDoState extends Equatable{
  final List<int>toDoList;
  const ToDoState({this.toDoList =const[]});

ToDoState copyWith({List<int>? toDoList}){
  return ToDoState(toDoList:  toDoList ?? this.toDoList);
}
  @override
  List<Object?> get props => [toDoList];
}