import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final int number;
  final String title;
  const SummaryCard({
    super.key, required this.number, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('$number',style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600
            ),),
            Text('$title')
          ],
        ),
      ),
    );
  }
}