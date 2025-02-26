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