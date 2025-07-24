import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = (context.read<AuthBloc>().state as Authenticated).user;

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome ${user.email}"),
        actions: [IconButton(icon: const Icon(Icons.logout), onPressed: () => context.read<AuthBloc>().add(LogoutRequested()))],
      ),
      body: const Center(child: Text("Home Screen")),
    );
  }
}
