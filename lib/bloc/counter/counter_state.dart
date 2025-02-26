
import 'package:equatable/equatable.dart';

class CounterState extends Equatable{
  final int counterValue;
  final bool switchValue;
  const CounterState({this.counterValue = 0,this.switchValue=false});
  CounterState copyWith({int?counter,bool?switchValue}){
    return CounterState(
      counterValue: counter ?? this.counterValue,
      switchValue: switchValue?? this.switchValue,

    );
  }

  @override
  List<Object?> get props => [counterValue,switchValue];
}
