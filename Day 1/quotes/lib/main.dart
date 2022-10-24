import 'package:flutter/material.dart';
import 'quotes.dart';

void main() {
  runApp(
    MaterialApp(
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

  Widget quoteTemplate(Quote quote) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.quote,
              style: TextStyle(
                fontSize: 18,
                color: Colors.purpleAccent[800],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              quote.author,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome Quotes"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
          child: Column(
        children: quotesList.map(
          (e) {
            return quoteTemplate(e);
          },
        ).toList(),
      )),
    );
  }
}
