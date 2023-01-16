import 'package:flutter/material.dart';

class EnlargeAnimation extends StatefulWidget {
  const EnlargeAnimation({super.key});

  @override
  State<EnlargeAnimation> createState() => _EnlargeAnimationState();
}

class _EnlargeAnimationState extends State<EnlargeAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation colorAnimation;
  @override
  void initState() {
    super.initState();
    colorAnimation = ColorTween(begin: Colors.amber, end: Colors.indigo)
        .animate(_controller);
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return TweenAnimationBuilder(
      tween: Tween(begin: 100, end: width),
      duration: Duration(seconds: 2),
      builder: (context, value, child) => Container(
        height: height,
        width: width,
        child: Center(
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 1),
            builder: (context, value, child) => CircularProgressIndicator(
              value: value,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}
