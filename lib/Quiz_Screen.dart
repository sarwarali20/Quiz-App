import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  List<String> correctAnswers = [];

  final List<Map<String, Object>> questions = [
    {
      'question': 'What is the capital of Pakistan?',
      'options': ['Lahore', 'Islamabad', 'Karachi', 'Peshawar'],
      'answer': 1 // Correct: Islamabad
    },
    {
      'question': 'Who is known as the founder of Pakistan?',
      'options': [
        'Allama Iqbal',
        'Liaquat Ali Khan',
        'Muhammad Ali Jinnah',
        'Zulfikar Ali Bhutto'
      ],
      'answer': 2 // Correct: Muhammad Ali Jinnah
    },
    {
      'question': 'Which is the national language of Pakistan?',
      'options': ['Punjabi', 'Urdu', 'Pashto', 'Sindhi'],
      'answer': 1 // Correct: Urdu
    },
    {
      'question': 'In which year did Pakistan gain independence?',
      'options': ['1945', '1947', '1948', '1950'],
      'answer': 1 // Correct: 1947
    },
    {
      'question': 'What is the national animal of Pakistan?',
      'options': ['Elephant', 'Markhor', 'Lion', 'Tiger'],
      'answer': 1 // Correct: Markhor
    },
    {
      'question': 'Which of the following is NOT a province of Pakistan?',
      'options': ['Sindh', 'Punjab', 'Balochistan', 'Kashmir'],
      'answer': 3 // Correct: Kashmir
    },
    {
      'question': 'Which city is known as the City of Lights?',
      'options': ['Karachi', 'Lahore', 'Islamabad', 'Quetta'],
      'answer': 0 // Correct: Karachi
    },
    {
      'question': 'What is the currency of Pakistan?',
      'options': ['Rupee', 'Dollar', 'Pound', 'Yen'],
      'answer': 0 // Correct: Rupee
    },
    {
      'question': 'Which mountain range is found in northern Pakistan?',
      'options': ['Himalayas', 'Andes', 'Rockies', 'Alps'],
      'answer': 0 // Correct: Himalayas
    },
    {
      'question': 'Who was the first female Prime Minister of Pakistan?',
      'options': [
        'Fatima Jinnah',
        'Benazir Bhutto',
        'Hina Rabbani Khar',
        'Shireen Mazari'
      ],
      'answer': 1 // Correct: Benazir Bhutto
    },
  ];

  void answerQuestion(int selectedOption) {
    // Check if the selected answer is correct
    int correctAnswerIndex = questions[currentQuestionIndex]['answer'] as int;
    
    if (selectedOption == correctAnswerIndex) {
      score++;
    }

    // Add the correct answer to the correctAnswers list
    correctAnswers.add((questions[currentQuestionIndex]['options'] as List<String>)[correctAnswerIndex]);

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Pass score and correct answers when navigating to the result screen
        Navigator.pushReplacementNamed(
          context,
          '/result',
          arguments: {
            'score': score,
            'correctAnswers': correctAnswers,
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.green[900],
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}/${questions.length}',
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              questions[currentQuestionIndex]['question'] as String,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Column(
              children: (questions[currentQuestionIndex]['options'] as List<String>).asMap().entries.map((entry) {
                int index = entry.key;
                String option = entry.value;

                return GestureDetector(
                  onTap: () => answerQuestion(index),
                  child: Container(
                    width: screenWidth * 0.5,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(
                            String.fromCharCode('A'.codeUnitAt(0) + index),
                            style: TextStyle(color: Colors.blue[900]),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            option,
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
