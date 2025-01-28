import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: RandomDogImage(),
        ),
      ),
    );
  }
}

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  final String endpoint = 'https://dog.ceo/api/breeds/image/random';

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> {
  // Create state variables
  String dogImageUrl = 'https://images.dog.ceo/breeds/terrier-welsh/lucy.jpg';

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
        dogImageUrl = url;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Display the dog image
    // Display a button that refreshes the dog image
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          dogImageUrl,
          height: 250,
        ),
        TextButton(
          onPressed: () {
            getRandomDogURL().then((url) {
              setState(() {
                dogImageUrl = url;
              });
            });
          },
          child: Text('Refresh Dog Image'),
        )
      ],
    );
  }
}
