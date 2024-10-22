

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  //CounterCubit(super.initialState);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  void reset() => emit(0);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    //print(change.nextState);
    if(change.nextState == 5) {
      // does nor work ...
      //emit(0);
    }
  }
}