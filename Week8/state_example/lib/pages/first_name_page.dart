import 'package:flutter/material.dart';

import 'package:state_example/widgets/user_notifier.dart';

class FirstNamePage extends StatelessWidget {
  const FirstNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserNotifier.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Name Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 24.0,
            ),
            ListenableBuilder(
                listenable: user,
                builder: (context, _) {
                  return Text('User name: ${user.firstName} ${user.lastName}');
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user firs name here
        onPressed: () {
          user.firstName = 'NewFirstName';
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
