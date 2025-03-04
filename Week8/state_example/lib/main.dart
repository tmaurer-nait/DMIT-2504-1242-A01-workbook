import 'package:flutter/material.dart';
import 'package:state_example/models/user.dart';
import 'package:state_example/widgets/user_notifier.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

User user = User('Bobby', 'Marlone');

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserNotifier(
      user: user,
      child: Builder(builder: (context) {
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: HomePage(),
            ),
          ),
        );
      }),
    );
  }
}
