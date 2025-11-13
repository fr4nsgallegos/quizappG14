import 'package:flutter/material.dart';
import 'package:quizappg14/models/question_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> score = [];

  List<QuestionModel> questions = [
    QuestionModel(question: "El hombre llegó a la luna", asnwer: true),
    QuestionModel(question: "¿Has cenado hoy?", asnwer: false),
    QuestionModel(question: "¿Saliste ayer?", asnwer: false),
    QuestionModel(question: "¿Has desayunado?", asnwer: true),
    QuestionModel(question: "¿Sientes frio?", asnwer: false),
    QuestionModel(question: "El sol es una estrella", asnwer: true),
    QuestionModel(question: "Flutter usa Dart", asnwer: true),
  ];
  int questionIndex = 0;

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

  void nextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
    } else {
      print("Se acabaron las preguntas");
    }
    setState(() {});
  }

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = questions[questionIndex].asnwer;

    if (userAnswer == correctAnswer) {
      score.add(itemScore((questionIndex + 1).toString(), true));
    } else {
      score.add(itemScore((questionIndex + 1).toString(), false));
    }

    if (questionIndex < questions.length - 1) {
      questionIndex++;
    } else {
      print("Fin del cuestionario ");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  questions[questionIndex].question,
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
    );
  }
}
