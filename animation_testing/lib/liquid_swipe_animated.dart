import 'package:animation_testing/liquid_swipe_pages.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidPageAnimated extends StatefulWidget {
  const LiquidPageAnimated({super.key});

  @override
  State<LiquidPageAnimated> createState() => _LiquidPageAnimatedState();
}

class _LiquidPageAnimatedState extends State<LiquidPageAnimated> {
  late final LiquidController _controller;

  int index = 0;
  @override
  void initState() {
    super.initState();
    _controller = LiquidController();
  }

  final List<LiquidSwipePage> _pages = [
    LiquidSwipePage(color: Colors.amber, nextPageButton: () {}),
    LiquidSwipePage(color: Colors.red[300], nextPageButton: () {}),
    LiquidSwipePage(color: Colors.purpleAccent[100], nextPageButton: () {}),
    LiquidSwipePage(color: Colors.indigoAccent[100], nextPageButton: () {}),
  ];

  animateToNext() {
    if (index != _pages.length - 1) {
      index = index + 1;
      _controller.animateToPage(
        page: index,
        duration: 300,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            liquidController: _controller,
            pages: _pages,
            disableUserGesture: true,
          ),
          Center(
            child: IconButton(
              onPressed: animateToNext,
              icon: const Icon(
                Icons.arrow_right_alt,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
