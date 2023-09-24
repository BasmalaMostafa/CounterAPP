import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counterapp/Logic/manager/InternetCubit/internet_cubit.dart';
import 'package:counterapp/Logic/manager/SettingsCubit/settings_cubit.dart';
import 'package:counterapp/presentation/views/counter_screen.dart';
import 'package:counterapp/presentation/views/settings_screen.dart';
import 'package:counterapp/shared/Components/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Logic/manager/CounterCubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final MyColors myColors = const MyColors();

  final Strings strings = const Strings();

  late var mainColor;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: Connectivity()),
        ),
        BlocProvider<SettingsCubit>(
          create: (context) => SettingsCubit(),
        ),
      ],
      //the closest navigator instance
      child: MaterialApp(
        // theme: ThemeData(
        //   primarySwatch: Colors.teal
        // ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) {
            mainColor = myColors.myTeal;
            return CounterScreen(
              color: myColors.myTeal, title: strings.appBar1, org: true,);
          },
          '/orangeCounter': (context) {
            mainColor = myColors.orange;
            return CounterScreen(
              color: myColors.orange, title: strings.appBar2, org: false,);
          },
          '/purpleCounter': (context) {
            mainColor = myColors.purple;
            return CounterScreen(
              color: myColors.purple, title: strings.appBar3, org: false,);
          },
          '/settings' : (context) =>
              SettingsScreen(title: 'Settings', color: mainColor,),
        },
      ),
    );
  }
}

















