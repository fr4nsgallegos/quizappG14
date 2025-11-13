import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String questionText = "¿El hombre llegó a la luna?";
  List<String> questions = [
    "El hombre llegó a la luna",
    "¿Has cenado hoy?",
    "¿Saliste ayer?",
    "¿Has desayunado?",
    "¿Sientes frio?",
  ];
  int questionIndex = 0;

  void nextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
    } else {
      questionIndex = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quizz App"), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Text(questions[questionIndex]),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                nextQuestion();
              },
              child: Text("Verdadero"),
            ),
            ElevatedButton(
              onPressed: () {
                nextQuestion();
              },
              child: Text("Falso"),
            ),
          ],
        ),
      ),
    );
  }
}
