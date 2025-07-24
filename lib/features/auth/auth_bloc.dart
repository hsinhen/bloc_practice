import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>((event, emit) async {
      emit(AuthLoading());
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('email');
      final name = prefs.getString('name');
      final token = prefs.getString('token');
      final role = prefs.getString('role');
      await Future.delayed(Duration(seconds: 1));
      if (email != null && name != null && token != null && role != null) {
        emit(Authenticated(User(email: email, name: name, role: role, token: token)));
      } else {
        emit(Unauthenticated());
      }
    });

    on<LoginRequested>((event, emit) async {
      print('testoooo even.email ${event.email}');

      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 1));
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', event.email);
      await prefs.setString('name', 'User');
      await prefs.setString('token', 'token_123');
      await prefs.setString('role', event.email == 'admin' ? 'admin' : 'user');

      emit(
        Authenticated(
          User(email: event.email, name: event.email == 'admin' ? 'Admin' : 'User', role: event.email == 'admin' ? 'admin' : 'user', token: 'token_123'),
        ),
      );
    });

    on<LogoutRequested>((event, emit) async {
      emit(AuthLoading());
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      await Future.delayed(Duration(milliseconds: 500));
      emit(Unauthenticated());
    });

    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 1));
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', event.email);
      await prefs.setString('name', event.name);
      await prefs.setString('token', 'registered_token');
      await prefs.setString('role', event.role);
      emit(Authenticated(User(email: event.email, name: event.name, role: event.role, token: 'registered_token')));
    });
  }
}

// ----------------------------- EVENTS -----------------------------
abstract class AuthEvent {}

class AppStarted extends AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  LoginRequested(this.email, this.password);
}

class LogoutRequested extends AuthEvent {}

class RegisterRequested extends AuthEvent {
  final String name, email, password, role;
  RegisterRequested({required this.name, required this.email, required this.password, required this.role});
}

// ----------------------------- STATES -----------------------------
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final User user;
  Authenticated(this.user);
}

class Unauthenticated extends AuthState {}
