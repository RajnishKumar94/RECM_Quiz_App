import 'package:flutter/material.dart';
import 'package:recm_quiz_app/data/questions.dart';
import 'package:recm_quiz_app/models/answer_button.dart';


class QuestionScreen extends StatefulWidget {
    final void Function(String answer) onSelectAnswer;

  const QuestionScreen({super.key, required this.onSelectAnswer});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQustion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });}

    @override
    Widget build(BuildContext context) {
      final currentQuestion = questions[currentQuestionIndex];
      return SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                currentQuestion.text,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return 
                Padding(padding: EdgeInsets.only(bottom: 10),child:      AnswerButton(
                    answerText: answer,
                    ontap: () {
                      answerQustion(answer);
                    }) ,)
;           
              })
            ]),
          ));
    }
  }