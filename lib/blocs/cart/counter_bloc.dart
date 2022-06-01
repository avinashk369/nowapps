import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Cubit<int> {
  CounterBloc() : super(1);

  void increment() {
    if (state < 24) emit(state + 1);
  }

  void decrement() {
    if (state > 1) emit(state - 1);
  }
}
