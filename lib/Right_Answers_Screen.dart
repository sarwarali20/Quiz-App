import 'package:flutter/material.dart';

class RightAnswersScreen extends StatelessWidget {
  final List<String> correctAnswers;

  const RightAnswersScreen({super.key, required this.correctAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      appBar: AppBar(
        title: const Text('Correct Answers'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Correct Answers:',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Display the correct answers
            Expanded(
              child: ListView.builder(
                itemCount: correctAnswers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Q${index + 1}: ${correctAnswers[index]}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
