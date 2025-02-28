import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo({
    required this.description,
    required this.completed,
    this.id,
  });

  String description;
  bool completed;
  String? id;

  // factory constructor
  factory Todo.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Todo(
      description: data?['description'],
      completed: data?['completed'],
      // use the doc id for the todo id
      id: snapshot.id,
    );
  }

  // toMap function
  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'completed': completed,
    };
  }
}
