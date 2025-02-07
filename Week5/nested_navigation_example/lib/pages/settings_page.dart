import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings Page')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  //TODO: Navigate
                },
                child: Text('Go to Option 1 Page')),
            ElevatedButton(
                onPressed: () {
                  //TODO: Navigate
                },
                child: Text('Go to Option 2 Page')),
            ElevatedButton(
                onPressed: () {
                  //TODO: Navigate
                },
                child: Text('Go to Option 3 Page')),
          ],
        ),
      ),
    );
  }
}
