import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../theme/theme_cubic.dart';
import 'counter_cubit.dart';
import 'counter_state.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();
    final themeCubit = context.read<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Theme: ${context.select((ThemeCubit cubit) => cubit.state == ThemeMode.dark ? 'dark' : 'light')}'),

            SizedBox(height: 10),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text('Count: ${state.count}');
              },
            ),
            Text('Step: ${context.select((CounterCubit cubit) => cubit.state.step)}'),
            BlocBuilder<CounterCubit, CounterState>(
              buildWhen: (prev, curr) =>
                  DateTime(prev.updatedAt.year, prev.updatedAt.month, prev.updatedAt.day, prev.updatedAt.hour, prev.updatedAt.minute) !=
                  DateTime(curr.updatedAt.year, curr.updatedAt.month, curr.updatedAt.day, curr.updatedAt.hour, curr.updatedAt.minute),
              builder: (context, state) {
                return Text('Count: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(state.updatedAt)}');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(heroTag: 'second_fab', onPressed: counterCubit.decrement, child: const Icon(Icons.remove)),
          SizedBox(height: 10),
          FloatingActionButton(heroTag: 'firstfan', onPressed: counterCubit.increment, child: const Icon(Icons.add)),
        ],
      ),
    );
  }
}
