import 'package:quizappg14/models/question_model.dart';

class Quizbrain {
  bool isFinished = false;

  List<QuestionModel> questionList = [
    QuestionModel(question: "El hombre llegó a la luna", asnwer: true),
    QuestionModel(question: "¿Has cenado hoy?", asnwer: false),
    QuestionModel(question: "¿Saliste ayer?", asnwer: false),
    QuestionModel(question: "¿Has desayunado?", asnwer: true),
    QuestionModel(question: "¿Sientes frio?", asnwer: false),
    QuestionModel(question: "El sol es una estrella", asnwer: true),
    QuestionModel(question: "Flutter usa Dart", asnwer: true),
  ];
  int questionIndex = 0;

  String getQuestionText() {
    return questionList[questionIndex].question;
  }

  bool getQuestionAnswer() {
    return questionList[questionIndex].asnwer;
  }

  void nextQuestion() {
    if (questionIndex < questionList.length - 1) {
      questionIndex++;
    } else {
      isFinished = true;
      print("Se acabaron las preguntas");
    }
  }

  bool isFinishedFunc() {
    return isFinished;
  }

  void restartQuizz() {
    questionIndex = 0;
    isFinished = false;
  }
}
