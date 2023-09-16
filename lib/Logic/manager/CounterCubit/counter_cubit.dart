import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counterapp/shared/Components/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../InternetCubit/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late final StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit}) : super(CounterState(counterValue: 0)){
    //مش شغاله يا مولانا
    internetStreamSubscription = internetCubit.listen(
            (internetState){
      if(internetState is InternetConnected && internetState.connectionType ==ConnectionType.wifi){
        increment();
      }else if(internetState is InternetConnected && internetState.connectionType ==ConnectionType.mobileData){
        decrement();
      }
    });
  }

  static CounterCubit get(context) => BlocProvider.of(context);

  void increment() => emit(CounterState(counterValue: state.counterValue + 1,incremented: true));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1,incremented: false));

  @override
  Future<void> close() {
    // TODO: implement close
    internetStreamSubscription.cancel();
    return super.close();
  }
}
