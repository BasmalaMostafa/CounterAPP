import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends HydratedCubit<CounterState>{        //or with the HydratedMixin
  CounterCubit() : super(CounterState(counterValue: 0));

  static CounterCubit get(context) => BlocProvider.of(context);  //context.read<CounterCubit>();

  void increment() => emit(CounterState(counterValue: state.counterValue + 1,incremented: true));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1,incremented: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {     //called for every time the APP needs locally stored data
   return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {       //called for every state emitted by this cubit
    return state.toMap();
  }

  @override
  void onChange(Change<CounterState> change) {
    // TODO: implement onChange
    print(change);
    super.onChange(change);
  }
}














//bloc listener listens to a stream of data.
//but builder listens and rebuild ui based on a stream of data.








