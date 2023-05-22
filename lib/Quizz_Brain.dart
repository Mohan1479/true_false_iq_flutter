import 'Question.dart';

class Quizz_Brain {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question(
        'Variables in Swift must be explicitly declared with a type.', true),
    Question('Swift is a statically-typed programming language.', true),
    Question('Swift supports multiple inheritance.', false),
    Question('Swift is an open-source programming language.', true),
    Question(
        'Optionals in Swift allow variables to hold either a value or nil.',
        true),
    Question('Swift uses automatic reference counting (ARC) to manage memory.',
        true),
    Question('Swift supports operator overloading.', true),
    Question(
        'Swift uses semicolons at the end of each line, similar to languages like C or Java.',
        false),
    Question('Swift\'s switch statement supports pattern matching.', true),
    Question(
        'Swift provides built-in support for functional programming concepts like map, filter, and reduce.',
        true)
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  bool isFinished() {
    return (_questionNumber < _questionBank.length - 1) ? false : true;
  }

  void resetQuestionBank() {
    _questionNumber = 0;
  }
}
