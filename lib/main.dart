import 'package:flutter/material.dart';
import 'Quizz_Brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizz_Brain quizz_brain = Quizz_Brain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizz_brain.getQuestionAnswer();

    if (quizz_brain.isFinished()) {
      Alert(
              context: context,
              title: "Completed",
              desc: "The Quizz is completed")
          .show();
      setState(() {
        scoreKeeper = [];
        quizz_brain.resetQuestionBank();
      });
    } else {
      setState(() {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizz_brain.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizz_brain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15.0),
            margin: EdgeInsets.all(10.0),
            color: Colors.green,
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15.0),
            margin: EdgeInsets.all(10.0),
            color: Colors.red,
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
