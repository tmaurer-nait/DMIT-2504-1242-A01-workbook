import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('option1');
                },
                child: Text('Go to Option 1 Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('option2');
                },
                child: Text('Go to Option 2 Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('option3');
                },
                child: Text('Go to Option 3 Page')),
          ],
        ),
      ),
    );
  }
}
