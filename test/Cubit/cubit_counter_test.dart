import 'package:bloc_test/bloc_test.dart';
import 'package:counterapp/manager/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:counterapp/main.dart';

void main() {
  group('Counter Cubit Test', () {
    CounterCubit counterCubit;

    setUp((){
      counterCubit = CounterCubit();

      test('check if the initial state for the counter cubit is CounterState(counterValue:0)', () {
        expect(counterCubit.state, CounterState(counterValue: 0));
      });

      blocTest('check that the cubit should emit a counterState(counterValue:1 ,incremented:true) '
          'when counterCubit.incremented() fun is called',
        build: ()=> counterCubit,
        act: (cubit) =>cubit.increment(),
        expect: ()=> CounterState(counterValue: 1,incremented: true),
      );

      blocTest('check that the cubit should emit a counterState(counterValue:-1 ,incremented:false) '
          'when counterCubit.decremented() fun is called',
        build: ()=> counterCubit,
        act: (cubit) =>cubit.decrement(),
        expect: ()=> CounterState(counterValue: -1,incremented: false),
      );

      tearDown((){
        counterCubit.close();
      });
    });
  });
}














