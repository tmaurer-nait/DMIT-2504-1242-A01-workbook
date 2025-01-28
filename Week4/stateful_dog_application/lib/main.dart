import 'package:flutter/material.dart';

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

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> {
  // Create state variables
  String dogImageUrl = 'https://images.dog.ceo/breeds/terrier-welsh/lucy.jpg';

  // TODO: Create a helper function getRandomDogURL

  // TODO: Override the initState to fetch a new dog on load

  @override
  Widget build(BuildContext context) {
    // Display the dog image

    // TODO: Display a button that refreshes the dog image
    return Column(
      children: [
        Image.network(dogImageUrl),
      ],
    );
  }
}
