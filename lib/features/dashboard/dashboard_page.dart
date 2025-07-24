import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dashboard_cubit.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => DashboardCubit()..loadData(), child: const Page1());
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<DashboardCubit>().state;

    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Dashboard State: $data")),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: context.read<DashboardCubit>(), // reuse existing instance
                    child: const Page2(),
                  ),
                ),
              ),
              child: const Text('Go to Page 2'),
            ),
            // SizedBox(height: 10),
            // ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Back')),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<DashboardCubit>(), // reuse existing instance
                child: const Page3(),
              ),
            ),
          ),
          child: const Text('Go to Page 3'),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<DashboardCubit>(), // reuse existing instance
                child: const Page4(),
              ),
            ),
          ),
          child: const Text('Go to Page 4'),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 4')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<DashboardCubit>(), // reuse existing instance
                child: const Page5(),
              ),
            ),
          ),
          child: const Text('Go to Page 5'),
        ),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<DashboardCubit>().state;

    return Scaffold(
      appBar: AppBar(title: const Text("Page 5")),
      body: Center(child: Text("Dashboard State: $data")),
    );
  }
}
