

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mitch/counter/counter_cubit.dart';
import 'package:flutter_bloc_mitch/counter/counter_view.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {

    

    return BlocProvider(
      create: (_) => CounterCubit(),
      //create: (context) => CounterCubit(0),
      child: BlocListener<CounterCubit, int>(
        listener: (context, state) {
          if (state < 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Negative Value! Resetting to 0'),
              ),
            );
          }
          if (state == 10) {
            final counterCubit = context.read<CounterCubit>();
            showDialog(
              context: context, 
              builder: (context) => AlertDialog(
                title: const Text('Limit Reached'),
                content: const Text('You have reached the maximum limit of 10.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      counterCubit.reset();
                      Navigator.of(context).pop();
                    },
                    child: const Text('Reset'),
                  ),
                ],
              )
            );
          }
        },
        child: const CounterView(),
      ),
    );
  }
}