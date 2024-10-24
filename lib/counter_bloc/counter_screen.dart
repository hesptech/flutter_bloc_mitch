import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mitch/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_mitch/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_mitch/counter_bloc/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final counterBloc = context.read<CounterBloc>();

    /* return BlocProvider(
      create: (_) => CounterBloc(),
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.counterValue.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),

                  TextButton(
                    onPressed: () => context.read<CounterBloc>().add(IncrementEvent()),
                    child: const Text('Increment'),
                  ),

                  TextButton(
                    onPressed: () => context.read<CounterBloc>().add(DecrementEvent()),
                    child: const Text('Decrement'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ); */

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocProvider(
              create: (_) => CounterBloc(),
              /* child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {  
                  return CounterView(context: context);
                },
              ), */
              child: const CounterView(),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.counterValue.toString(),
              style: const TextStyle(fontSize: 50),
            ),
            TextButton(
              onPressed: () => counterBloc.add(IncrementEvent()),
              child: const Text('Increment'),
            ),
            TextButton(
              onPressed: () => counterBloc.add(DecrementEvent()),
              child: const Text('Decrement'),
            ),
          ],
        );
      },
    );
  }
}


/* class CounterView extends StatefulWidget {
  final BuildContext context;
  const CounterView({super.key, required this.context});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {

    final counterBloc = context.read<CounterBloc>();

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(counterBloc.state.counterValue.toString(),
            style: const TextStyle(fontSize: 50),
          ),
      
          TextButton(
            onPressed: () => counterBloc.add(IncrementEvent()),
            child: const Text('Increment'),
          ),
      
          TextButton(
            onPressed: () => counterBloc.add(DecrementEvent()),
            child: const Text('Decrement'),
          ),
        ],
      );
  }
} */