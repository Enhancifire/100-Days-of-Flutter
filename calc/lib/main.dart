import 'package:calc/state_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:math_expressions/math_expressions.dart';

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
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => ThemeModel(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String eqn = "";
  String eqnBkp = "";

  void addToEqn(String str) {
    setState(() {
      eqn = eqn + str;
    });
  }

  void placeHolder(String str) {}

  void deleteLast(String str) {
    final int eqnlen = eqn.length;
    setState(() {
      eqn = eqn.substring(0, eqnlen - 1);
    });
  }

  void clr(String str) {
    setState(() {
      eqn = '';
      eqnBkp = '';
    });
  }

  void evaluateExp(String _) {
    setState(() {
      eqnBkp = eqn;
      Parser p = Parser();
      Expression exp = p.parse(eqn.replaceAll('X', '*'));
      double eval = exp.evaluate(EvaluationType.REAL, ContextModel());

      eqn = eval.toString();
    });
    // eqn = eqnBkp;
    // eqnBkp = "";
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Consumer<ThemeModel>(
      builder: ((context, theme, child) => Scaffold(
            backgroundColor: theme.darkTheme ? theme.bg : theme.bgDark,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: theme.darkTheme ? theme.bg : theme.bgDark,
              iconTheme: IconThemeData(
                color: theme.darkTheme ? theme.text : theme.textDark,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    theme.darkTheme = theme.darkTheme ? false : true;
                  },
                  icon: theme.darkTheme
                      ? Icon(
                          Icons.light_mode,
                        )
                      : Icon(
                          Icons.dark_mode,
			  color: theme.highlightRow,
                        ),
                )
              ],
            ),
            drawer: Drawer(
              backgroundColor: theme.darkTheme ? theme.bg : theme.bgDark,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Light',
                        style: TextStyle(
                            color: theme.darkTheme
                                ? theme.highlightText
                                : theme.highlightTextDark),
                      ),
                      Switch(
                        value: theme.darkTheme,
                        onChanged: (val) {
                          theme.darkTheme = val;
                        },
                        activeColor: theme.highlightTextDark,
                      ),
                      Text(
                        'Dark',
                        style: TextStyle(
                            color: theme.darkTheme
                                ? theme.highlightText
                                : theme.highlightTextDark),
                      ),
                    ],
                  )
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            eqnBkp,
                            style: TextStyle(
                              fontSize: 30,
                              color: theme.darkTheme
                                  ? theme.text
                                  : theme.textDark.withOpacity(0.6),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            eqn,
                            style: TextStyle(
                              fontSize: 50,
                              color:
                                  theme.darkTheme ? theme.text : theme.textDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 7,
                    child: GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      children: [
                        HighlightedButton(str: 'AC', fun: clr),
                        HighlightedButton(str: '(', fun: addToEqn),
                        HighlightedButton(str: ')', fun: addToEqn),
                        HighlightedButton(str: '/', fun: addToEqn),
                        NormalButton(str: '7', fun: addToEqn),
                        NormalButton(str: '8', fun: addToEqn),
                        NormalButton(str: '9', fun: addToEqn),
                        HighlightedButton(str: 'X', fun: addToEqn),
                        NormalButton(str: '4', fun: addToEqn),
                        NormalButton(str: '5', fun: addToEqn),
                        NormalButton(str: '6', fun: addToEqn),
                        HighlightedButton(str: '-', fun: addToEqn),
                        NormalButton(str: '1', fun: addToEqn),
                        NormalButton(str: '2', fun: addToEqn),
                        NormalButton(str: '3', fun: addToEqn),
                        HighlightedButton(str: '+', fun: addToEqn),
                        NormalButton(str: '.', fun: addToEqn),
                        NormalButton(str: '0', fun: addToEqn),
                        NormalButton(str: 'DEL', fun: deleteLast),
                        HighlightedButton(str: '=', fun: evaluateExp),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}

class HighlightedButton extends StatelessWidget {
  const HighlightedButton({
    Key? key,
    required this.str,
    required this.fun,
  }) : super(key: key);

  final String str;
  final Function fun;

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
  }) : super(key: key);

  final String str;
  final Function fun;

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
