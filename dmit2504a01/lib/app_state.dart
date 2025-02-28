import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dmit2504a01/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;

import 'firebase_options.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  User? _user;
  User? get user => _user;
  set user(User? user) {
    if (user == null) {
      throw ArgumentError('Cannot set user to null');
    }
    _user = user;
  }

  List<Todo>? _todos;
  List<Todo>? get todos {
    if (user == null) {
      throw StateError('Cannot get todos when user is null');
    }
    return _todos;
  }

  set todos(List<Todo>? todos) {
    if (user == null) {
      throw StateError('Cannot get todos when user is null');
    }
    if (todos == null) {
      throw ArgumentError('Cannot set todos to null');
    }
    _todos = todos;
  }

  void _fetchTodos() {
    if (user == null) {
      throw StateError('Cannot get todos when user is null');
    }

    FirebaseFirestore.instance
        .collection('/todos/${user!.uid}/todos')
        .get()
        .then((collectionSnapshot) {
      todos = collectionSnapshot.docs
          .map((doc) => Todo.fromFirestore(doc))
          .toList();
    });
  }

  void updateTodo({required Todo todo}) {
    if (user == null) {
      throw StateError('Cannot get todos when user is null');
    }

    FirebaseFirestore.instance
        .collection('/todos/${user!.uid}/todos')
        .doc(todo.id)
        .update(todo.toMap());
  }

  void deleteTodo({required Todo todo}) {
    if (user == null) {
      throw StateError('Cannot get todos when user is null');
    }

    FirebaseFirestore.instance
        .collection('/todos/${user!.uid}/todos')
        .doc(todo.id)
        .delete()
        .then((_) {
      todos!.remove(todo);
    });
  }

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;
        this.user = user;
        // Fetch the todos from firestore
        _fetchTodos();
      } else {
        _loggedIn = false;
      }
      notifyListeners();
    });
  }
}
