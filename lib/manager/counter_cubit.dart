import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  static CounterCubit get(context) => BlocProvider.of(context);

  void increment() => emit(CounterState(counterValue: state.counterValue + 1,incremented: true));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1,incremented: false));
}
