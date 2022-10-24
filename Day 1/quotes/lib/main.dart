import 'package:flutter/material.dart';
import 'quotes.dart';
import 'quotecard.dart';

void main() {
  runApp(
    const MaterialApp(
      home: QuoteList(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotesList = [
    Quote(
      author: "Oscar Wilde",
      quote: 'Be Yourself; Everyone else is already taken',
    ),
    Quote(
        quote: 'I have nothing to declare except my genius',
        author: "Oscar Wilde"),
    Quote(
        quote:
            'Time flows on... Like a Mighty Stream, Like an Unending Dream...',
        author: "Faiz Saiyad"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Awesome Quotes"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        children: quotesList
            .map((e) => QuoteCard(
                quote: e,
                delete: () {
                  setState(() {
                    quotesList.remove(e);
                  });
                }))
            .toList(),
      ),
    );
  }
}
