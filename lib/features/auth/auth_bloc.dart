import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AppStarted>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      emit(Unauthenticated());
    });

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 1));

      // Fake auth logic: accept anything
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        emit(Authenticated(User(email: event.email)));
      } else {
        emit(Unauthenticated());
      }
    });

    on<LogoutRequested>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(milliseconds: 500));
      emit(Unauthenticated());
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

// ----------------------------- STATES -----------------------------
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final User user;
  Authenticated(this.user);
}

class Unauthenticated extends AuthState {}

class AuthLoading extends AuthState {}
