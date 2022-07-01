import 'package:flutter/material.dart';
import 'package:flutter_codigo_quizapp/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  QuizBrain quizbrain = QuizBrain();

  checkAnswer(bool userAnswer) {
    if (quizbrain.isFinished() == true) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "QuizApp",
        desc: "El quiz ha finalizado",
        buttons: [
          DialogButton(
            child: Text(
              "ACEPTAR",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      quizbrain.restart();
      scoreKeeper.clear();
      setState(() {});
    } else {
      bool correctAnswer = quizbrain.getQuestionAnswer();

      if (correctAnswer == userAnswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.greenAccent,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.redAccent,
        ));
      }

      quizbrain.nextQuestion();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text("QuizApp"),
        centerTitle: true,
        backgroundColor: Colors.black87,
        elevation: 10,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quizbrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text("Verdadero"),
                color: Colors.greenAccent,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text("Falso"),
                color: Colors.redAccent,
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
