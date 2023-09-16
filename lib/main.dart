import 'package:counterapp/presentation/views/counter_screen.dart';
import 'package:counterapp/shared/Components/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Logic/manager/CounterCubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final MyColors myColors = const MyColors();

  final Strings strings = const Strings();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child:  MaterialApp(
        // theme: ThemeData(
        //   primarySwatch: Colors.teal
        // ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) =>
              CounterScreen(color: myColors.myTeal, title: strings.appBar1, org: true,),
          '/orangeCounter' : (context) =>
              CounterScreen(color: myColors.orange, title: strings.appBar2, org: false,),
          '/purpleCounter' : (context) =>
              CounterScreen(color: myColors.purple, title: strings.appBar3, org: false,),
        },
      ),
    );
  }
}
