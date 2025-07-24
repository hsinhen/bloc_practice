import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hen_bloc_practice/features/counter/counter_cubit.dart';
import 'package:hen_bloc_practice/features/theme/theme_cubic.dart';
import 'package:intl/intl.dart';

import '../counter/counter_state.dart';
import '../counter/second_page.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Step: ${context.select((ThemeCubit cubit) => cubit.state == ThemeMode.dark ? 'Dark' : 'Light')}')],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'theme',
            onPressed: () {
              themeCubit.toggleTheme();
            },
            child: const Icon(Icons.dark_mode),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'home_fab',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(create: (_) => CounterCubit(), child: SecondPage()),
                ),
              );
            },
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
