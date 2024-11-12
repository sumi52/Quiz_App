import 'package:flutter/material.dart';
import 'package:quiz_app_solution/pages/question_page.dart';
import 'package:quiz_app_solution/temp_db.dart';

class ResultPage extends StatelessWidget {  //eta k ststeless widget e rakhchi cz ei page e to kono kaj nai,user interaction er upor kono kaj hobe emn to kichu nai
  static const String routeName ='/result';
  int rightAnswers = 0;  //rightAnswer name e ekta variable rakha hoiche jar inisial 1 0
   ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    calculateResult();  //build method e scaffolt call korar age calculateResult name ekta method call kora hoiche
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESULT'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Correct Answers'),
            Text('$rightAnswers', style: TextStyle(fontSize: 30),),
           TextButton(       //1ta button nibo
             onPressed: () => Navigator.pushReplacementNamed(context, QuestionPage.routeName),
             child: const Text('GO BACK'),
           )
          ],
        ),
      ),
    );
  }

  calculateResult() {
    for(var map in questionList) {  //jekhane sudhu matro oi questionList otate loop chalano hoiche
      if(map[givenAnswer] == map[rightAnswer]) { //loop chaliye dekhtechi givenAnswer r rightAnswer equal kina,
        rightAnswers++;  //jodi equal hoy tahole rightAnswer 1ta kore barbe

      }
    }
  }
}
