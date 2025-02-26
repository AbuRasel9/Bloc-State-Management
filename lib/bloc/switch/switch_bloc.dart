import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/switch/switch_event.dart';
import 'package:bloc_state_management/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{
  SwitchBloc():super(const SwitchState()){
    on<SwitchOnOffEvent>(_switchOnOff);
    on<SliderIncrementDecrementEvent>(_sliderIncrementDecrementEvent);
  }
  void _switchOnOff(SwitchOnOffEvent event,Emitter<SwitchState>emit){
    emit(state.copyWith(switchValue: event.switchValue));

  }
  void _sliderIncrementDecrementEvent(SliderIncrementDecrementEvent event,Emitter <SwitchState>emit){
    emit(state.copyWith(sliderValue: event.sliderValue));
  }



}