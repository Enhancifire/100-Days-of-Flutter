import 'package:animation_testing/animate.dart';
import 'package:animation_testing/enlarge_animation.dart';
import 'package:animation_testing/liquid_swipe_animated.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return const LiquidPageAnimated();
    // return const Scaffold(
    //   body: EnlargeAnimation(),
    // );
    return AnimationTesting();
  }
}
