import 'package:dmit2504a01/app_state.dart';
import 'package:dmit2504a01/models/todo.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({required this.appState, super.key});

  final ApplicationState appState;

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> _todoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _todoList = widget.appState.todos!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
