import 'package:equatable/equatable.dart';

class ToDoState extends Equatable{
  final List<int>toDoList;
  const ToDoState({this.toDoList =const[1,2,3,4,5,6]});

ToDoState copyWith({int? value}){
  return ToDoState(toDoList: )
}
  @override
  List<Object?> get props => [toDoList];
}