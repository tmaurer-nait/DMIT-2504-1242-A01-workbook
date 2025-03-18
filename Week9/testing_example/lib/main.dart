import 'package:flutter/material.dart';
import 'package:testing_example/models/user.dart';
import 'package:testing_example/widgets/user_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: UserWidget(
            user: User(email: 'tmaurer@nait.ca', name: 'Tom Maurer'),
          ),
        ),
      ),
    );
  }
}
