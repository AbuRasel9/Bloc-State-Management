import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool switchValue;
  final double sliderValue;

  const SwitchState( {this.sliderValue=1.0,this.switchValue = false});

  SwitchState copyWith({bool? switchValue,double?sliderValue}) {
    return SwitchState(switchValue: switchValue ?? this.switchValue,sliderValue: sliderValue ?? this.sliderValue,);
  }

  @override
  List<Object?> get props => [switchValue,sliderValue];
}
