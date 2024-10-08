import 'package:flutter/material.dart';
import 'package:recm_quiz_app/data/questions.dart';
import 'package:recm_quiz_app/question_screen.dart';
import 'package:recm_quiz_app/results_screen.dart';
import 'package:recm_quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers=[];
  var activeScreen='start-screen';

  void switchScreen(){
    setState(() {
      activeScreen='questions-screen';
    });

  }
  void chooseAnswer(String answer){
   selectedAnswers.add(answer);

  if (selectedAnswers.length==questions.length){
      setState(() {
        activeScreen='results-screen';

      });
  }
  }
   void restartQuiz(){
     setState(() {
       activeScreen='questions-screen';

     });
   }     
    @override
  Widget build(BuildContext context) {
    Widget screenWidget=StartScreen(switchScreen);
    
    if (activeScreen=='questions-screen'){
      screenWidget=QuestionScreen(
         onSelectAnswer:chooseAnswer,


      );

    }
      if (activeScreen=='results-screen'){
        screenWidget=ResultsScreen(
          chosenAnswers:selectedAnswers,
          onRestart:restartQuiz,
        );

      }
    return MaterialApp(
         debugShowCheckedModeBanner: false,
         home:Scaffold(
           body:Container(
             decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                 Color.fromARGB(255, 245, 145, 132),
                    Color.fromARGB(255, 230, 44, 11),


                ],
                begin:Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
             ),
               child: screenWidget,
           ),

         ),



    );
  }
}  

   










  


  

 
  