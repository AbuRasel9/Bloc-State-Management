import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable{
  SwitchEvent();
  @override
  List<Object>get props=>[];
}
class SwitchOnOffEvent extends SwitchEvent{
  final bool switchValue;
  SwitchOnOffEvent({required this.switchValue});
  @override
  List<Object>get props=>[switchValue];
}
class SliderIncrementDecrementEvent extends SwitchEvent{
  final double sliderValue;
  SliderIncrementDecrementEvent({required this.sliderValue});
  @override
  List<Object>get props=>[sliderValue];
}