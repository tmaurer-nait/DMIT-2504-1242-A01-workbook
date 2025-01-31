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
          child: UserSignupForm(),
        ),
      ),
    );
  }
}

// Stage 3: Refactor into its own stateful widget and add form key
class UserSignupForm extends StatefulWidget {
  const UserSignupForm({super.key});

  @override
  State<UserSignupForm> createState() => _UserSignupFormState();
}

class _UserSignupFormState extends State<UserSignupForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<_UserSignupFormState>.

  final _formKey = GlobalKey<FormState>();

  // Step 4: Add controllers to get the input value out of the form fields
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
            controller: _usernameController,
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Username cannot be empty'
                : null,
            decoration: InputDecoration(
              label: Text('Username'),
            ),
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              label: Text('Password'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Validate the fields
              if (_formKey.currentState!.validate()) {
                // Normally here you would submit the values to the registration API
                // If valid show snackbar
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Username: ${_usernameController.text}, Password: ${_passwordController.text}')));

                // Reset the form to have no text in it
                _formKey.currentState!.reset();
              }
            },
            child: Text('Sign Up'),
          )
        ],
      ),
    );
  }
}
