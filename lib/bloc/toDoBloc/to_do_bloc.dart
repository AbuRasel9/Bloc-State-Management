import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/toDoBloc/to_do_event.dart';
import 'package:bloc_state_management/bloc/toDoBloc/to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(ToDoState()) {
    on<ToDoAddEvent>(_toDoAddEvent);
    on<ToDoDeleteEvent>(_toDoRemoveEvent);
  }

  void _toDoAddEvent(ToDoAddEvent event, Emitter<ToDoState> emit) {
    final updatedList = List<int>.from(state.toDoList)..add(event.value);
    emit(state.copyWith(toDoList: updatedList));
  }

  void _toDoRemoveEvent(ToDoDeleteEvent event, Emitter<ToDoState> emit) {
    final updatedList = List<int>.from(state.toDoList)..removeAt(event.index);
    emit(state.copyWith(toDoList: updatedList));
  }
}