

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mitch/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_mitch/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counterValue: 0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(counterValue: state.counterValue + 1));
    });

    on<DecrementEvent>((event, emit) {
      emit(CounterState(counterValue: state.counterValue - 1));
    });
  }
}