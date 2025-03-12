import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Position? _position;

  @override
  void initState() {
    super.initState();
    _position = null;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check that location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service is disabled on this device');
    }

    permission = await Geolocator.checkPermission();
    // If we already have permissions skip the ask
    if (permission == LocationPermission.denied) {
      // If we don't have permission, ask for permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // If we don't get permission return an error
        // Here you could ask again, show UI explaining the issue, stop doing location things
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    // Any code past this point has location service access
    return await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.best),
    );
  }

  void _handlePress() async {
    try {
      final position = await _determinePosition();
      setState(() {
        _position = position;
      });
    } catch (e) {
      // If we don't have permissions, set position to null
      setState(() {
        _position = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text('Location: ${_position ?? "unknown"}'),
                ElevatedButton(
                  onPressed: _handlePress,
                  child: Text('Get Position'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
