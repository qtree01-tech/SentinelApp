import 'package:flutter/material.dart';

class DecisionCard extends StatelessWidget {
  final String title;
  final String content;

  DecisionCard({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
    );
  }
}
