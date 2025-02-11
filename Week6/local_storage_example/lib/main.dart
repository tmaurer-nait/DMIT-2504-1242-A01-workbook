import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_storage_example/widgets/random_dog_image.dart';

// Implement a light and dark mode toggle using shared preferences
// Reimplement the Dinder app
// Save the last loaded dog to file storage
// TODO: Save likes and dislikes to shared preferences

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _darkMode = true;

  Future<bool> _readDarkModeFromPrefs() async {
    // First we get the shared prefs instance
    final prefs = await SharedPreferences.getInstance();
    // Then we can read a bool from it
    return prefs.getBool('darkMode') ?? false;
  }

  @override
  void initState() {
    super.initState();
    _readDarkModeFromPrefs().then((value) {
      setState(() {
        _darkMode = value;
      });
    });
  }

  Widget _buildDarkModeSwitch() {
    return SwitchListTile(
        value: _darkMode,
        title: Text('Dark Mode:'),
        onChanged: (value) async {
          setState(() {
            _darkMode = value;
          });

          // Write to shared prefs
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('darkMode', value);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _darkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(title: Text('Local Storage Demo')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDarkModeSwitch(),
              RandomDogImage(),
              Text(_darkMode ? 'WOOF' : 'woof')
            ],
          ),
        ),
      ),
    );
  }
}
