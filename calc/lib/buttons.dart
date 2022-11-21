import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calc/state_model.dart';

class HighlightedButton extends StatelessWidget {
  const HighlightedButton({
    Key? key,
    required this.str,
    required this.fun,
    required this.height,
  }) : super(key: key);

  final String str;
  final Function fun;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, theme, child) => GestureDetector(
        onTap: () {
          fun(str);
        },
        child: Container(
          decoration: BoxDecoration(
            color:
                theme.darkTheme ? theme.highlightRow : theme.highlightRowDark,
          ),
          child: Center(
            child: Text(
              str,
              style: TextStyle(
                color: theme.darkTheme
                    ? theme.highlightText
                    : theme.highlightTextDark,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NormalButton extends StatelessWidget {
  const NormalButton({
    Key? key,
    required this.str,
    required this.fun,
    required this.height,
  }) : super(key: key);

  final String str;
  final Function fun;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, theme, child) => GestureDetector(
        onTap: () {
          fun(str);
        },
        child: Container(
          decoration: BoxDecoration(
            color: theme.darkTheme ? theme.bg : theme.bgDark,
          ),
          child: Center(
            child: Text(
              str,
              style: TextStyle(
                color: theme.darkTheme ? theme.text : theme.textDark,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

