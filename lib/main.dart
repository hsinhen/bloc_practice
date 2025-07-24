import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/auth_bloc.dart';
import 'features/auth/pages/home_page.dart';
import 'features/auth/pages/login_page.dart';
import 'features/auth/pages/splash_page.dart';
import 'features/user/user_cubit.dart';
import 'features/user/user_page.dart';

//Tutorial 5
void main() {
  runApp(BlocProvider(create: (_) => AuthBloc()..add(AppStarted()), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) return HomePage();
          if (state is Unauthenticated) return LoginPage();
          return SplashScreen();
        },
      ),
    );
  }
}

//Tutorial 4
// void main() {
//   runApp(BlocProvider(create: (_) => UserFormCubit(), child: const MyApp()));
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: const Page1());
//   }
// }

//Tutorial 3
// void main() {
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(title: 'BLoC Demo', home: const HomeApp());
//   }
// }

//Tutorial 2
// void main() {
//   runApp(
//     MultiBlocProvider(
//       providers: [
//         // BlocProvider(create: (_) => CounterCubit()),
//         BlocProvider(create: (_) => ThemeCubit()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ThemeCubit, ThemeMode>(
//       builder: (context, themeMode) {
//         return MaterialApp(
//           title: 'BLoC Multi-Screen Demo',
//           theme: ThemeData.light(),
//           darkTheme: ThemeData.dark(),
//           themeMode: themeMode,
//           home: const ThemePage(),
//         );
//       },
//     );
//   }
// }

// Tutorial 1
// void main() {
//   runApp(BlocProvider(create: (_) => CounterCubit(), child: const MyApp()));
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(title: 'BLoC Demo', home: const CounterPage());
//   }
// }
