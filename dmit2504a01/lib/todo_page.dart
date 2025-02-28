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
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: _buildList(_todoList),
    );
  }

  Widget _buildList(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        // TODO: Add a way to delete Todos
        return Dismissible(
          key: UniqueKey(),
          child: ListTile(
            title: Text(
              todo.description,
              style: TextStyle(
                decoration: todo.completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            trailing: Checkbox(
                value: todo.completed,
                onChanged: (value) {
                  setState(() {
                    todo.completed = value!;
                    // TODO: Tell the app state to update firestore
                  });
                }),
            shape: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          onDismissed: (direction) {
            setState(() {
              // Update the local state
              todos.removeAt(index);
              // TODO: Tell the app state to update firestore
            });
          },
        );
      },
    );
  }
}
