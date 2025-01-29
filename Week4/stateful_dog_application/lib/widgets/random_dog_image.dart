import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

    getRandomDogURL().then((url) {
      setState(() {
        _dogImageUrl = url;
      });
    });
  }

  Widget _buildDogImage() {
    return _dogImageUrl.isEmpty
        ? CircularProgressIndicator()
        : GestureDetector(
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
            child: Image.network(
              _dogImageUrl,
              height: 250,
            ),
          );
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
