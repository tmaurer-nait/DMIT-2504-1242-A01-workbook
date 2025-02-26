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
        _todos = [];
        // TODO: Fetch the todos from firestore
      } else {
        _loggedIn = false;
      }
      notifyListeners();
    });
  }
}
