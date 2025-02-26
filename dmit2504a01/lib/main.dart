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
        return SignInScreen(
          actions: [
            AuthStateChangeAction((context, state) {
              // Auth state has changed, find out what happened and deal with it
              final user = switch (state) {
                SignedIn state => state.user,
                UserCreated state => state.credential.user,
                _ => null
              };

              if (user == null) {
                return;
              }

              if (state is UserCreated) {
                // new user, update display name
                user.updateDisplayName(user.email!.split('@').first);
              }

              // Remove the dialog
              Navigator.pop(context);
              // Push replacement
              Navigator.pushReplacementNamed(context, '/');
            })
          ],
        );
      },
      '/profile': (context) {
        return ProfileScreen(
          actions: [
            SignedOutAction((context) {
              // Remove the dialog
              Navigator.pop(context);
              // Push replacement
              Navigator.pushReplacementNamed(context, '/');
            })
          ],
        );
      }
    };

    return MaterialApp(
      routes: routes,
    );
  }
}
