 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StartScreen extends StatelessWidget {
  final void Function() startQuiz;

  const StartScreen(
    this.startQuiz, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/recm.png',
            width: 300,
            fit: BoxFit.fitWidth,          
          ),
          const SizedBox(height: 80),
          Text(
            'RECM QUIZ APP',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(194, 221, 232, 220),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                backgroundColor: const Color.fromARGB(224, 221, 201, 209)),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}



