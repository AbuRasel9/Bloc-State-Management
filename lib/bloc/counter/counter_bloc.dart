import 'package:bloc_state_management/bloc/counter/counter_event.dart';
import 'package:bloc_state_management/bloc/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterBloc extends Bloc<CounterEvent,CounterState>{
  CounterBloc():super(const CounterState()){
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);

  }
  void _increment(IncrementEvent event,Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counterValue+1));
  }
  void _decrement(DecrementEvent event,Emitter<CounterState>emit){
    emit(state.copyWith(counter: state.counterValue-1));
  }


}

