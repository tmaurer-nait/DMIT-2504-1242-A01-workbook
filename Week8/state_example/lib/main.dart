import 'package:flutter/material.dart';
import 'package:state_example/models/user.dart';

import 'package:provider/provider.dart';
import 'pages/home_page.dart';

void main() {
  // Wrap the main app in a change notifier provider
  // This will provide access to our user state in the widget tree
  runApp(ChangeNotifierProvider(
    create: (context) => User('Jeff', 'Geoff'),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: HomePage(),
        ),
      ),
    );
  }
}
