import 'package:counterapp/manager/counter_cubit.dart';
import 'package:counterapp/views/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child:  MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal
        ),
        debugShowCheckedModeBanner: false,
        home: const CounterScreen(),
      ),
    );
  }
}
