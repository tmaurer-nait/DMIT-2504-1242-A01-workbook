import 'package:flutter/material.dart';
import 'package:nested_navigation_example/pages/home_page.dart';
import 'package:nested_navigation_example/pages/settings/settings_manager.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Builder function, takes in RouteSettings and must return Route Widget
      onGenerateRoute: (settings) {
        Widget page;

        switch (settings.name) {
          case '/':
            page = HomePage();
            break;

          case '/settings/settings_home':
            page = SettingsManager(
              initialRoute: settings.name!.substring(10),
            );
            break;

          default:
            throw Exception('Unknown Route Used: ${settings.name}');
        }

        return MaterialPageRoute(
            builder: (context) => page, settings: settings);
      },
    );
  }
}
