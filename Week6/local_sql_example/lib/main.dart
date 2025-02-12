import 'package:flutter/material.dart';
import 'package:local_sql_example/models/dog.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Dog> dogs = [
    Dog(id: 0, name: 'Buttercup', age: 7),
    Dog(id: 1, name: 'Remi', age: 2)
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.separated(
          itemBuilder: (context, index) {
            final dog = dogs[index];
            return ListTile(title: Text('${dog.name} - ${dog.age}'));
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: dogs.length,
        ),
      ),
    );
  }
}
