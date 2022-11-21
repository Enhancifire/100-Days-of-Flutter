import 'package:flutter/material.dart';
import 'package:calc/buttons.dart';

class GridIcons extends StatelessWidget {
  const GridIcons({
    super.key,
    required this.clr,
    required this.addToEqn,
    required this.deleteLast,
    required this.evaluateExp,
  });

  final Function clr;
  final Function addToEqn;
  final Function deleteLast;
  final Function evaluateExp;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      children: [
        HighlightedButton(
          str: 'AC',
          fun: clr,
	  height: height / 4,
        ),
        HighlightedButton(
          str: '(',
          fun: addToEqn,
	  height: height / 4,
        ),
        HighlightedButton(
          str: ')',
          fun: addToEqn,
	  height: height / 4,
        ),
        HighlightedButton(
          str: '/',
          fun: addToEqn,
	  height: height / 4,
        ),
        NormalButton(
          str: '7',
          fun: addToEqn,
	  height: height / 4,
        ),
        NormalButton(
          str: '8',
          fun: addToEqn,
	  height: height / 4,
        ),
        NormalButton(
          str: '9',
          fun: addToEqn,
	  height: height / 4,
        ),
        HighlightedButton(
          str: 'X',
          fun: addToEqn,
	  height: height / 4,
        ),
        NormalButton(
          str: '4',
          fun: addToEqn,
	  height: height / 4,
        ),
        NormalButton(
          str: '5',
          fun: addToEqn,
	  height: height / 4,
        ),
        NormalButton(
          str: '6',
          fun: addToEqn,
	  height: height / 4,
        ),
        HighlightedButton(
          str: '-',
          fun: addToEqn,
	  height: height / 4,
        ),
        NormalButton(
          str: '1',
          fun: addToEqn,
	  height: height / 4,
        ),
        NormalButton(
          str: '2',
          fun: addToEqn,
	  height: height / 4,
        ),
        NormalButton(
          str: '3',
          fun: addToEqn,
	  height: height / 4,
        ),
        HighlightedButton(
          str: '+',
          fun: addToEqn,
	  height: height / 4,
        ),
        NormalButton(
          str: '.',
          fun: addToEqn,
	  height: height / 4,
        ),
        NormalButton(
          str: '0',
          fun: addToEqn,
	  height: height / 4,
        ),
        NormalButton(
          str: 'DEL',
          fun: deleteLast,
	  height: height / 4,
        ),
        HighlightedButton(
          str: '=',
          fun: evaluateExp,
	  height: height / 4,
        ),
      ],
    );
  }
}
