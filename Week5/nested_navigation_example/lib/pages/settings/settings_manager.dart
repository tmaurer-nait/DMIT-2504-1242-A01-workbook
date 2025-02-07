import 'package:flutter/material.dart';
import 'package:nested_navigation_example/pages/settings/option1_page.dart';
import 'package:nested_navigation_example/pages/settings/option2_page.dart';
import 'package:nested_navigation_example/pages/settings/option3_page.dart';
import 'package:nested_navigation_example/pages/settings_page.dart';

class SettingsManager extends StatefulWidget {
  final String initialRoute;

  const SettingsManager({required this.initialRoute, super.key});

  @override
  State<SettingsManager> createState() => _SettingsManagerState();
}

class _SettingsManagerState extends State<SettingsManager> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  Route _onGenerateRoute(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case 'settings_home':
        page = SettingsPage();
        break;
      case 'option1':
        page = Option1Page();
        break;
      case 'option2':
        page = Option2Page();
        break;
      case 'option3':
        page = Option3Page();
        break;
      default:
        page = SizedBox.shrink();
    }

    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
        title: Text('App Settings'),
        leading: IconButton(
          onPressed: () {
            // Check if the sibling navigator (the one for settings pages) can be popped
            // If not pop the parent navigator
            if (_navigatorKey.currentState!.canPop()) {
              _navigatorKey.currentState!.pop();
            } else {
              Navigator.of(context).pop();
            }
          },
          icon: Icon(Icons.arrow_back),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Navigator(
        key: _navigatorKey,
        initialRoute: widget.initialRoute,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}
