import 'package:counterapp/manager/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Counter APP')
      ),
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          // TODO: implement listener
          if(state.incremented == true){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Incremented!'),
                duration: Duration(microseconds: 300),
              )
            );
          }else if(state.incremented == false){
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Decremented!'),
                  duration: Duration(microseconds: 300),
                )
            );
          }
        },
        builder: (context, state) {
          var counter = CounterCubit.get(context);
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    counter.decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                Text('${state.counterValue}', style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.grey),),
                FloatingActionButton(
                  onPressed: () {
                    counter.increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
