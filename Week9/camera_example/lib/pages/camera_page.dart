import 'package:camera_example/pages/photos_page.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({required this.description, super.key});

  final CameraDescription description;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late XFile? imageFile;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(widget.description, ResolutionPreset.max);

    _controller.initialize().then((_) {
      if (!mounted) return;
      setState(() {
        // Useful for rerendering after controller is initialized
        // If we wanted to we could set camera presets here
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        if (e.code == 'CameraAccessDenied') {
          // Decide how to handle no permisions
          // ex. reprompt, shut down, reroute
          print(e);
        } // Handle other exceptions here
      }
    });
  }

  Future<XFile?> takePicture() async {
    // Do nothing if we are already taking a picture
    if (_controller.value.isTakingPicture) return null;

    try {
      final XFile file = await _controller.takePicture();
      return file;
    } on CameraException catch (e) {
      // Could try taking another picture, tell the user it failed, crash the app
      print(e);
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Not ready to take pictures'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Page'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PhotosPage()));
            },
            icon: Icon(Icons.photo),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: CameraPreview(_controller)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (mounted) {
            takePicture().then((file) {
              // Store the file in the state
              setState(() {
                imageFile = file;
              });
              // show a message of where the file is saved
              if (file != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Picture saved to ${file.path}')));
              }
            });
          }
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
