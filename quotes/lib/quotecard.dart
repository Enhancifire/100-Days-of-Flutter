import 'package:flutter/material.dart';
import 'quotes.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function() delete;

  const QuoteCard({super.key, required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
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
            const SizedBox(
              height: 10,
            ),
            Text(
              quote.author,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton.icon(
              onPressed: delete,
              icon: Icon(
                Icons.delete,
                color: Colors.purpleAccent[600],
              ),
              label: Text(
                "Delete",
                style: TextStyle(color: Colors.purpleAccent[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
