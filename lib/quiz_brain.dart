import 'package:flutter_codigo_quizapp/question.dart';

class QuizBrain {
  List<Question> _questions = [
    Question(questionText: "El hombre llegó a la luna?", questionAnswer: true),
    Question(questionText: "Has almorzado algo?", questionAnswer: true),
    Question(questionText: "Sientes frio?", questionAnswer: false),
    Question(questionText: "Vas a salir mañana?", questionAnswer: true),
  ];

  int _questionNumber = 0;

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void restart() {
    _questionNumber = 0;
  }
}
