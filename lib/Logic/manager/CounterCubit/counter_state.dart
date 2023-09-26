part of 'counter_cubit.dart';


class CounterState extends Equatable{
  final int counterValue;
  bool? incremented;

  CounterState({required this.counterValue,incremented});

  @override
  // TODO: implement props
  List<Object?> get props => [counterValue,incremented];

  //doesn't work well
  Map<String, dynamic> toMap() {
    return {
      'counterValue': this.counterValue,
      'incremented': this.incremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
      incremented: map['incremented'] as bool,
    );
  }

  @override
  String toString() {
    return 'CounterState{counterValue: $counterValue, incremented: $incremented}';
  }

//Assssssssssssssssssssssssssk
  //
  // String toJson() => json.encode(toMap());
  //
  // factory CounterState.fromJson(String source) =>
  //     CounterState.fromMap(json.decode(source));


  // factory CounterState.fromJson(Map<String, dynamic> json) {
  //   return CounterState(
  //     counterValue: int.parse(json["counterValue"]),
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     "counterValue": counterValue,
  //   };
  // }
//
}
