import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final List<String> correctAnswers;

  const ResultScreen({super.key, required this.score, required this.correctAnswers});

  @override
  Widget build(BuildContext context) {
    const int totalQuestions = 10;

    // Define remarks based on score
    String getRemarks() {
      if (score == totalQuestions) {
        return "Excellent! You're a quiz master!";
      } else if (score >= totalQuestions * 0.8) {
        return "Great job! Keep it up!";
      } else if (score >= totalQuestions * 0.5) {
        return "Good effort! You can do even better!";
      } else {
        return "Better luck next time!";
      }
    }

    return Scaffold(
      backgroundColor: Colors.green[900],
      appBar: AppBar(
        title: const Text('Quiz Result'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Your Score',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Show score out of total (e.g., 2 out of 10)
            Text(
              '$score out of $totalQuestions',
              style: const TextStyle(
                fontSize: 60,
                color: Colors.yellowAccent, // Highlight the score
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            // Display remarks based on the score
            Text(
              getRemarks(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            // Button to view correct answers
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/right_answers',
                  arguments: correctAnswers, // Passing correct answers to next screen
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('View Correct Answers'),
            ),
            const SizedBox(height: 30),
            // Retry Button
            ElevatedButton(
              onPressed: () {
                // Navigate back to the quiz screen for retry
                Navigator.pushReplacementNamed(context, '/quiz');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Correct property for button background color
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
