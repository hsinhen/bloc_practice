import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void increment() {
    emit(state.copyWith(count: state.count + 1, updatedAt: DateTime.now()));
    changeStep(state.step + 1);
  }

  void decrement() {
    emit(state.copyWith(count: state.count - 1, updatedAt: DateTime.now()));
    changeStep(state.step + 1);
  }

  void changeStep(int newStep) {
    emit(state.copyWith(step: newStep));
  }
}
