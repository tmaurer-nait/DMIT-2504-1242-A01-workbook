import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:camera_example/pages/camera_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  List<CameraDescription> cameras = await availableCameras();

  runApp(MainApp(
    description: cameras[0],
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({required this.description, super.key});

  final CameraDescription description;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CameraPage(description: description),
    );
  }
}
