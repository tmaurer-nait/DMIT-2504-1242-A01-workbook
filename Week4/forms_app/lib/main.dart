import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// Stage 2: put it in a form
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            child: Column(
              children: [
                Text(
                  'New User Form',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  // Option 2 for validator
                  // validator: (value){
                  //   if(value == null || value.trim().isEmpty){
                  //     return 'Username cannot be empty';
                  //   } else {
                  //     return null;
                  //   }
                  // }
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Username cannot be empty'
                      : null,
                  decoration: InputDecoration(
                    label: Text('Username'),
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    label: Text('Password'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Sign Up'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
