import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:animations_example/pages/animation_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transforms'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Just a plain transform
            Transform.rotate(
              angle: 90 * math.pi / 180,
              child: Text('Rotate Only'),
            ),
            SizedBox(
              height: 110,
            ),
            Transform.scale(
              scale: 1.5,
              child: Transform.translate(
                offset: Offset(-50, 50),
                child: Transform.rotate(
                    angle: math.pi, child: Text('Scale, translate, rotate')),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AnimationPage()));
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
