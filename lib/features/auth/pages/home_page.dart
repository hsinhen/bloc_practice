import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_bloc.dart';
import '../user_model.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home - ${user.name}'),
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: () => context.read<AuthBloc>().add(LogoutRequested()))],
      ),
      body: Center(child: Text('Welcome back, ${user.name}', style: TextStyle(fontSize: 24))),
    );
  }
}
