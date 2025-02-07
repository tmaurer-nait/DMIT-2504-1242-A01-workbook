import 'package:flutter/material.dart';

class SettingsManager extends StatefulWidget {
  final String initialRoute;

  const SettingsManager({required this.initialRoute, super.key});

  @override
  State<SettingsManager> createState() => _SettingsManagerState();
}

class _SettingsManagerState extends State<SettingsManager> {
  Route _onGenerateRoute(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case 'settings_home':
        break;
      case 'option1':
        break;
      case 'option2':
        break;
      case 'option3':
        break;
      default:
        page = SizedBox.shrink();
    }

    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Settings')),
      body: Navigator(
        initialRoute: widget.initialRoute,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}
