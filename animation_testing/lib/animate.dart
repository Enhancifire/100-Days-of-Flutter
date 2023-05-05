import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationTesting extends StatefulWidget {
  const AnimationTesting({super.key});

  @override
  State<AnimationTesting> createState() => _AnimationTestingState();
}

class _AnimationTestingState extends State<AnimationTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Faiz Saiyad',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'Faiz Saiyad',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'Faiz Saiyad',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'Faiz Saiyad',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'Faiz Saiyad',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'Faiz Saiyad',
                style: TextStyle(fontSize: 30),
              ),
            ]
                .animate(interval: 200.ms)
                .move(
                  begin: Offset(0, 10),
                  end: Offset(0, 0),
                )
                .fade(curve: Curves.easeIn)),
      ),
    );
  }
}
