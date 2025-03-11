import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = _controller.drive(CurveTween(curve: Curves.elasticInOut));
    _controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animations'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Basic Animation
              AnimatedBuilder(
                  animation: _controller,
                  child: Text('Basic rotation'),
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _controller.value * 2 * math.pi,
                      child: child,
                    );
                  }),
              SizedBox(height: 110),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 2 * math.pi),
                duration: Duration(seconds: 3),
                builder: (context, value, widget) {
                  return Transform.rotate(
                      angle: value, child: Text('Tween rotation'));
                },
              ),
              SizedBox(
                height: 110,
              ),
              AnimatedBuilder(
                animation: _animation,
                child: Text('curved animation'),
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animation.value * 2 * math.pi,
                    child: child,
                  );
                },
              ),
              SizedBox(
                height: 110,
              ),
              RotationTransition(
                turns: _controller,
                child: Text('Rotation Transition'),
              )
            ],
          ),
        ));
  }
}
