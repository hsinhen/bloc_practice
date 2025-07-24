import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'counter_cubit.dart';
import 'counter_state.dart';
import 'second_page.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
          FloatingActionButton(onPressed: counterCubit.increment, child: const Icon(Icons.add)),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'home_fab',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SecondPage()));
            },
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
