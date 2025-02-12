import 'package:flutter/material.dart';
import 'package:local_sql_example/managers/dog_db_manager.dart';
import 'package:local_sql_example/models/dog.dart';

import 'dart:math';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});
  final dogManager = DogDbManager.instance;
  final randomGenerator = Random();
  final randomNames = [
    'Buttercup',
    'Remi',
    'Fezzic',
    'Aspen',
    'Luna',
  ];

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Dog> dogs = [];
  int lastId = 0;

  @override
  void initState() {
    super.initState();
    _loadDogs();
  }

  @override
  void dispose() {
    super.dispose();
    widget.dogManager.closeDB();
  }

  Future<void> _loadDogs() async {
    try {
      final dbDogs = await widget.dogManager.getDogs();

      setState(() {
        dogs = dbDogs;
        lastId = dbDogs.isNotEmpty ? dbDogs.last.id : 0;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _createRandomDog() async {
    try {
      final randomName = widget.randomNames[
          widget.randomGenerator.nextInt(widget.randomNames.length - 1)];
      final newDog = Dog(
        id: lastId + 1,
        name: randomName,
        age: widget.randomGenerator.nextInt(20),
      );
      await widget.dogManager.insertDog(newDog);
      // refresh the state
      _loadDogs();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _removeDog(int id) async {
    try {
      await widget.dogManager.deleteDog(id);
      _loadDogs();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.separated(
          itemBuilder: (context, index) {
            final dog = dogs[index];
            return ListTile(
              title: Text('${dog.name} - ${dog.age}'),
              onTap: () {
                _removeDog(dog.id);
              },
            );
          },
          separatorBuilder: (_, __) => Divider(),
          itemCount: dogs.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _createRandomDog,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
