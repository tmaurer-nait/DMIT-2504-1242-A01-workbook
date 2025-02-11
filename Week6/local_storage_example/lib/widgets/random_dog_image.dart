import 'package:flutter/material.dart';
import 'dart:convert';
// flutter pub add http
import 'package:http/http.dart' as http;
// flutter pub add path_provider
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  final String endpoint = 'https://dog.ceo/api/breeds/image/random';

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> {
  // Create state variables
  String _dogImageUrl = '';
  int _likes = 0;
  int _dislikes = 0;

  // Create a helper function getRandomDogURL
  Future<String> getRandomDogURL() async {
    var endpointURI = Uri.parse(widget.endpoint);
    var response = await http.get(endpointURI);
    return jsonDecode(response.body)['message'];
  }

  // Override the initState to fetch a new dog on load
  @override
  void initState() {
    super.initState();

    getTemporaryDirectory().then((dir) {
      // Try to open the dog file
      final file = File('${dir.path}/dog.jpg');

      // If it exists set the state to be the local image url
      if (file.existsSync()) {
        setState(() {
          _dogImageUrl = '${dir.path}/dog.jpg';
        });
      } else {
        // Get a random image from the network and set the state to that
        getRandomDogURL().then((url) {
          setState(() {
            _dogImageUrl = url;
          });
        });
      }
    });
  }

  Widget _buildDogImage() {
    Widget childWidget;

    // No dog loaded show spinner
    if (_dogImageUrl.trim().isEmpty) {
      childWidget = CircularProgressIndicator();
    } else {
      // Check if dog is local image or internet image
      if (_dogImageUrl.startsWith('http')) {
        childWidget = Image.network(_dogImageUrl);

        // If we load an image from the internet we want to save it to a file
        // In case the user restarts the app, they'll see the same dog
        _saveImage(_dogImageUrl);
      } else {
        // Local image
        childWidget = Image.file(File(_dogImageUrl));
      }
    }

    return GestureDetector(
      onDoubleTap: () {
        getRandomDogURL().then((url) {
          setState(() {
            _dogImageUrl = url;
            _likes++;
          });
        });
      },
      onLongPress: () {
        getRandomDogURL().then((url) {
          setState(() {
            _dogImageUrl = url;
            _dislikes++;
          });
        });
      },
      child: childWidget,
    );
  }

  // Saves an image from the internet to a local temp file
  void _saveImage(String url) async {
    // Get the temp directory
    final dir = await getTemporaryDirectory();

    // create the file path
    final filePath = '${dir.path}/dog.jpg';

    // Get the image from the internet
    final response = await http.get(Uri.parse(url));

    // Open the file
    final file = File(filePath);
    file.writeAsBytesSync(response.bodyBytes);
  }

  @override
  Widget build(BuildContext context) {
    // Display the dog image
    // Display a button that refreshes the dog image
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDogImage(),
        LikeText(number: _likes),
        LikeText(
          number: _dislikes,
          isLike: false,
        )
      ],
    );
  }
}

class LikeText extends StatelessWidget {
  final bool isLike;
  final int number;

  const LikeText({this.isLike = true, required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Text(
            isLike ? 'Likes:' : 'Dislikes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            '$number',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
