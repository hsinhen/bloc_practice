import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int count;
  final int step;
  final DateTime updatedAt;

  const CounterState({required this.count, required this.step, required this.updatedAt});

  factory CounterState.initial() {
    return CounterState(count: 0, step: 1, updatedAt: DateTime.now());
  }

  CounterState copyWith({int? count, int? step, DateTime? updatedAt}) {
    return CounterState(count: count ?? this.count, step: step ?? this.step, updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  List<Object> get props => [count, step, updatedAt];
}
