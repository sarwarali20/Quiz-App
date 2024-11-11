import 'package:flutter/material.dart';
import 'Splash_Screen.dart';
import 'Login_Screen.dart';
import 'Quiz_Screen.dart';
import 'Result_Screen.dart';
import 'Right_Answers_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/result') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return ResultScreen(
                score: args['score'],
                correctAnswers: args['correctAnswers'],
              );
            },
          );
        } else if (settings.name == '/right_answers') {
          final args = settings.arguments as List<String>;
          return MaterialPageRoute(
            builder: (context) {
              return RightAnswersScreen(correctAnswers: args);
            },
          );
        }
        return null;
      },
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/quiz': (context) => const QuizScreen(),
      },
    );
  }
}
