import 'package:dmit2504a01/app_state.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.authAppState, super.key});

  final ApplicationState authAppState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth Demo'),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 16,
          ),
          ListenableBuilder(
              listenable: authAppState,
              builder: (context, _) {
                return authAppState.loggedIn
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: Text('Profile'))
                    : ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign-in');
                        },
                        child: Text('Sign in'));
              })
        ],
      ),
    );
  }
}
