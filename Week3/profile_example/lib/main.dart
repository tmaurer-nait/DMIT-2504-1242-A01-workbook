import 'package:flutter/material.dart';
import 'package:profile_example/widgets/profile_heading.dart';
import 'package:profile_example/widgets/profile_image.dart';
import 'package:profile_example/widgets/profile_info.dart';
import 'package:profile_example/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: generateLightTheme(ThemeData.dark()),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Profile App'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileHeading(),
                ProfileImage('assets/images/nathan.jpg'),
                ProfileInfo('Role', 'Instructor'),
                ProfileInfo('Team', 'DMIT'),
                ProfileInfo('Handle', 'tmaurer@nait'),
                ProfileInfo('Supervisor', 'Nathan Humphrey'),
              ],
            ),
          )),
    );
  }
}
