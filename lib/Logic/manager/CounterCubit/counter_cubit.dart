import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  static CounterCubit get(context) => BlocProvider.of(context);  //context.read<CounterCubit();

  void increment() => emit(CounterState(counterValue: state.counterValue + 1,incremented: true));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1,incremented: false));
}














//bloc listener listens to a stream of data.
//but builder listens and rebuild ui based on a stream of data.








