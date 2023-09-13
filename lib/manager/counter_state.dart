part of 'counter_cubit.dart';


class CounterState extends Equatable{
  int counterValue;
  bool? incremented;

  CounterState({required this.counterValue,incremented});

  @override
  // TODO: implement props
  List<Object?> get props => [counterValue,incremented];
}
