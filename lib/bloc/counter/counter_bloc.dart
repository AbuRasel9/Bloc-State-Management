import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state_management/bloc/counter/counter_event.dart';
import 'package:bloc_state_management/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(counter: 20)) {
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(
        counter: state.counter + 1,
      ),
    );
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(
        counter: state.counter - 1,
      ),
    );
  }
}
