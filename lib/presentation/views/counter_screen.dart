import 'package:counterapp/shared/Components/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Logic/manager/CounterCubit/counter_cubit.dart';
import '../../shared/Components/components.dart';

class CounterScreen extends StatelessWidget {
  final Color color;
  final String title;
  final bool org;
  final Components components = const Components();
  final MyColors colors= const MyColors();
  final Strings strings = const Strings();
  final FontSizes fontSizes = const FontSizes();

  const CounterScreen({super.key,required this.color,required this.title,required this.org});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(title),
        backgroundColor: color,
      ),
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          // TODO: implement listener
          if(state.incremented == true){
            components.snack(
                text: strings.snackIn,
                context: context);
          }else if(state.incremented == false){
            components.snack(
                text: strings.snackDe,
                context: context);
          }
        },
        builder: (context, state) {
          var counter = CounterCubit.get(context);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    components.floatingButton
                      (hero: strings.dec,
                        color: color,
                        function: () {
                          counter.decrement();
                        },
                        tip: strings.snackDe,
                        icon: Icons.remove),
                    Text('${state.counterValue}', style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSizes.counter,
                        color: colors.grey),),
                    components.floatingButton
                      (hero: strings.inc,
                        color: color,
                        function: () {
                          counter.increment();
                        },
                        tip: strings.snackIn,
                        icon: Icons.add),
                  ],
                ),
                org==true? Padding(
                  padding: EdgeInsets.all(const Dimensions().buttonsPadding),
                  child: Column(
                    children: [
                      components.space(),
                      components.button(
                          nav: '/orangeCounter',
                          color: colors.orange,
                          text: strings.button1,
                          context: context),
                      components.space(),
                      components.button(
                          nav: '/purpleCounter',
                          color: colors.purple,
                          text: strings.button2,
                          context: context),
                    ],
                  ),
                ):Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}
