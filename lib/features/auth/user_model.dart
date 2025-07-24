import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class User {
  final String email;
  final String name;
  final String role;
  final String token;

  User({required this.email, required this.name, required this.role, required this.token});
}
