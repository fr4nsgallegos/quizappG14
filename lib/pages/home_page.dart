import 'package:flutter/material.dart';
import 'package:quizappg14/models/question_model.dart';
import 'package:quizappg14/quizbrain.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> score = [];
  Quizbrain quizbrain = Quizbrain();

  Widget itemScore(String numberQuestion, bool isCorrect) {
    return Row(
      children: [
        Text(
          numberQuestion,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Icon(
          isCorrect ? Icons.check : Icons.close,
          color: isCorrect ? Colors.greenAccent : Colors.redAccent,
        ),
      ],
    );
  }

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizbrain.getQuestionAnswer();

    if (userAnswer == correctAnswer) {
      score.add(itemScore((quizbrain.questionIndex + 1).toString(), true));
    } else {
      score.add(itemScore((quizbrain.questionIndex + 1).toString(), false));
    }

    if (quizbrain.isFinishedFunc()) {
      print("El cuestionario ha terminado");
    } else {
      quizbrain.nextQuestion();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff262626),
        appBar: AppBar(
          title: Text("Quizz App"),
          centerTitle: true,
          backgroundColor: Color(0xff262626),
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    "${quizbrain.questionIndex + 1}. ${quizbrain.getQuestionText()}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.greenAccent,
                    minWidth: double.infinity,
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: Text("Verdadero"),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    color: Colors.redAccent,
                    minWidth: double.infinity,
                    onPressed: () {
                      checkAnswer(false);
                    },
                    child: Text("Falso"),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: score),
            ],
          ),
        ),
      ),
    );
  }
}
