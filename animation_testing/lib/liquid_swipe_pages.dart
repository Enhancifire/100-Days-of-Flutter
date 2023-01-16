import 'package:flutter/material.dart';

class LiquidSwipePage extends StatelessWidget {
  const LiquidSwipePage({
    super.key,
    required this.color,
    required this.nextPageButton,
  });

  final Color? color;
  final Function nextPageButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
    );
  }
}
