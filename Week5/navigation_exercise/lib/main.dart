import 'package:flutter/material.dart';
import 'package:navigation_exercise/routes.dart' as routes;
import 'package:navigation_exercise/pages/page_one.dart';
import 'package:navigation_exercise/pages/page_two.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        routes.homeRoute: (context) => PageOne(),
        routes.pageTwoRoute: (context) => PageTwo()
      },
    );
  }
}
