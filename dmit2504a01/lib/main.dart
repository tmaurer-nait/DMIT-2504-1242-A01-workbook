import 'package:dmit2504a01/home_page.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:dmit2504a01/app_state.dart';

Future<void> main() async {
  var authAppState = ApplicationState();

  runApp(MainApp(
    authAppState: authAppState,
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({required this.authAppState, super.key});

  final ApplicationState authAppState;

  @override
  Widget build(BuildContext context) {
    final routes = {
      '/': (context) {
        return HomePage(authAppState: authAppState);
      },
      '/sign-in': (context) {
        return SignInScreen();
      },
      '/profile': (context) {
        return ProfileScreen();
      }
    };

    return MaterialApp(
      routes: routes,
    );
  }
}
