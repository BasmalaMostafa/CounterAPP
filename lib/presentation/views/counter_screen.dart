import 'package:counterapp/Logic/manager/InternetCubit/internet_cubit.dart';
import 'package:counterapp/shared/Components/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Logic/manager/CounterCubit/counter_cubit.dart';
import '../../shared/Components/components.dart';
import '../../shared/Components/enums.dart';

class CounterScreen extends StatelessWidget {
  final Color color;
  final String title;
  final bool org;
  final Components components = const Components();
  final MyColors colors= const MyColors();
  final Strings strings = const Strings();
  final FontSizes fontSizes = const FontSizes();
  //final Connectivity connectivity;           //the least dependent one

  const CounterScreen({super.key,required this.color,required this.title,required this.org,});

  @override
  Widget build(BuildContext context) {
    // TODO: implement listener
    // if(state is InternetConnected && state.connectionType ==ConnectionType.wifi){
    //   counter.increment();
    // }
    // else if(state is InternetConnected && state.connectionType ==ConnectionType.mobileData){
    //   counter.decrement();
    // }
      return Scaffold(
      appBar: AppBar(
          title: Text(title),
        backgroundColor: color,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/settings');
          },
          icon: Icon(Icons.settings, color:colors.white,)),
        ],
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
                BlocBuilder<InternetCubit,InternetState>(
                    builder: (context,state){
                      if(state is InternetLoading){
                        return const CircularProgressIndicator();
                      }
                      else if(state is InternetConnected && state.connectionType ==ConnectionType.wifi){
                        // counter.increment();
                        return  Text('WIFI',
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(color: colors.myTeal),);
                      }
                      else if(state is InternetConnected && state.connectionType ==ConnectionType.mobileData){
                        // counter.decrement();
                        return Text('MobileData',
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(color: color),);
                      }else if(state is InternetDisconnected){
                        return Text('Disconnected',
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(color: colors.grey),);
                      }
                      return Container();
                    }
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: const Dimensions().buttonsPadding),
                  child: Row(
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
                ),
                Builder(
                    builder: (context){
                      final counterState =context.watch<CounterCubit>().state;
                      final internetState =context.watch<InternetCubit>().state;

                      if(internetState is InternetConnected && internetState.connectionType ==ConnectionType.wifi){
                      return  Text('Counter: ${counterState.counterValue}, Internet: WIFI',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: fontSizes.buttons),);
                      }
                      else if(internetState is InternetConnected && internetState.connectionType ==ConnectionType.mobileData){
                      return Text('Counter: ${counterState.counterValue}, Internet: Mobile',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: fontSizes.buttons),);
                      }else if(internetState is InternetDisconnected){
                      return Text('Counter: ${counterState.counterValue}, Internet: Disconnected',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: fontSizes.buttons),);
                      }
                      return Container();
                    }
                ),
                org==true? Padding(
                  padding: EdgeInsets.symmetric(horizontal: const Dimensions().buttonsPadding),
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
