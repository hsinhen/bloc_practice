import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_bloc.dart';
import '../user_model.dart';

class AdminPage extends StatelessWidget {
  final User user;
  const AdminPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel - ${user.name}'),
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: () => context.read<AuthBloc>().add(LogoutRequested()))],
      ),
      body: Center(child: Text('Welcome ${user.name}', style: TextStyle(fontSize: 24))),
    );
  }
}
