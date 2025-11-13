import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Lista Preguntas
  List<String> questions = [
    "El hombre llegó a la luna",
    "¿Has cenado hoy?",
    "¿Saliste ayer?",
    "¿Has desayunado?",
    "¿Sientes frio?",
    "El sol es una estrella",
    "Flutter usa Dart",
  ];
  int questionIndex = 0;

  void nextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
    } else {
      print("Se acabaron las preguntas");
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
                  questions[questionIndex],
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
                    nextQuestion();
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
                    nextQuestion();
                  },
                  child: Text("Falso"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
