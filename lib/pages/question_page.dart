import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app_solution/customewidgets/question_set_widget.dart';
import 'package:quiz_app_solution/pages/result_dart.dart';
import 'package:quiz_app_solution/temp_db.dart';

class QuestionPage extends StatefulWidget {
  static const String routeName = '/';
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int duration = 10; //variable declare kortechi, duration sec e dite hobe,1min = 60s.1min30sec = 90sec
  bool hasQuizStarted = false;
  String timeString = '';    //eta e Text(), widget show korbe, eta initially rakhtechi emty
  late Timer timer;  //golobally ekta timer er object declare kori,eta startTimer er modhe initializ hobe


  @override
  void didChangeDependencies() {   //method
    setTime();  //1st e setTime ta call korte hobe didChangeDependencies er modhe,setTime er modhe ei 90sec ta k oi formate e show
               // korte hobe,orthert 1min30sec, suru te e thakbe 1min 30sec stop hoye thakbe,START button e click korar sathe sathe e
       //eta minus hote thakbe 29,28 evabe cholte thakbe,e karone e app ta run korar sathe sathe e setTime name ekta method call kortechi

    super.didChangeDependencies();

  }

  startTimer() {   //method
   timer = Timer.periodic(const Duration(seconds: 1), (_) {   //(_) ei veriable ta use korbo na tai evabe dichi golobaly rakhchi amak 01:30 ei man
                                                   //ta k reversal korte hobe, 90 man ta 1 ,1 kore komate hobe sudhu komale e hobe na,1 komar por
                                          //je 89 hobe otar por abr setTime method ta call korte hobe,cz setTime method ta tokhon oi onujai amk
                                         //ekta string generate kore dibe jeta ami output e dekhbo,tar mane poti 1sec por por e amk setTime()
                                        //method ta call korte hobe,& 90 minus korte hobe but minus korte korte to ononto kal minus hobe na,1ta
                                        //nidisto somoy pojonto minus hobe
     if(duration  == 0)  {     //90 minus korte korte to ononto kal minus korbo na kotokhun minus korbo seta ekhane bole dibo,jokhon equal equal 0
                              // hobe tokhon cancel kore dibo
       timer.cancel();
       Navigator.pushReplacementNamed(context, ResultPage.routeName);  //r xm sesh howar age e jodi cancel hoye jay, mane 0 hoye jay tokhon next
                                                       // page e jete hobe,pushReplacementNamed korbo jete ei page ta k sompurno replace kore notun
                                                       //result page e jay,abr okhan theke jokhon abr start korbo ota o pushReplace kore ei quiz
                                                       // page ta k notun kore replace korbe,ques gulo abr reload hoye jabe
     } else {
       setState(() {   //1ta setState lagbe,cz setTime e kono setState use kori nai tai ekhane lagbe
         duration--;  //age minus korte hobe
         setTime();
       });
     }
   });
  }

  setTime() {     //date set korar jonno method

    timeString = DateFormat('mm:ss').format(DateTime.fromMillisecondsSinceEpoch(duration * 1000));  //jekhane eshe amra timeString er
                                                                  // modhe value ta hobe je package ta amra add korchi,sei package er 1ta
                                   // class hocche DateFormate,eta k import korte hobe,DateFormate ei constructor e amk ekta formate dite
                                 //hobe,jei formate e show korbe sei formate e show korte hobe,formate ta hocche string ba pattern,pattern
                                   //ta hiocche min(mm):sec(ss).ei pattern e formate korbe string,so amra string er modhe rakhtechi,formate
                                   // method ta ekta Datetime er object chai,but hate ache 1ta sec(90),milisec chacche sec k milisec korbo,
                                   // 1ta sec k 1000 diye gun dile e milisec hoye jabe,sudhu time na date k o formate korte pari day(dd),
                            //month(MM),year(yy),week(EEE) dile week er name er 3ta word dibe,(EEEE) dile pura week er name ta e print korbe

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, ResultPage.routeName),
            child: const Text('FINISH', style: TextStyle(color: Colors.white),),
          )
        ],
      ),
      body: Column(
        children: [
          Text(timeString, style: TextStyle(fontSize: 40),),     //quiz ta k arektu interactive korte chaile 1st e ekta Start button,
                                                                  // tahole column er 1st child hisabe ekta Text()
                              // widget neya uchit,eta show korbe ekta timer er moto,jeta like joto min toto uthbe,stop hoye thakbe,START
                                  // button e press korar sathe sathe Timer o start hoye jabe, e jonno kichu variable declare korte hobe,
                                  // eta e Time string show korbe
         if(!hasQuizStarted) ElevatedButton(    //column child hisabe nilam,ElevatedButton er age bole dibo je if(!hasQuizStarted) eta jotokhun
                                                // false thakbe START buttinta show korbe,false mane khela ekhono baki ache quiz suru hoy nai
            onPressed: () {
              setState(() {
                hasQuizStarted = true;  //hasQuizStarted true kore dibo tahole START QUIZ button e click korle ques set chole asbe & timer start
                                        // kore dite hobe
              });
              startTimer();  //Timer start korar jonno ei method ta call korte hobe
            },
            child: const Text('START QUIZ'), //ei button ta show korbe jotokhon hasQuizStarted false thakbe,eta jotokhun false thakbe ei question
                                            // set o asbe na emty thakbe
          ),

          if(hasQuizStarted) Expanded(    //eta ElevateButton er ulto hobe,eta jodi true hoy tahole ekhon ListView ta dekhabe mane ques set ta dekhabe
            child: ListView.builder( //surute 1ta ListView nitei hobe, Timer ta k jodi upore rakhte chai tahole ListView ta k column er vitore
                                    //rakhte hobe, & ListView ta k Expanded er modhe rakhte hobe
                itemCount: questionList.length, //questionList theke orthat ei collection ta theke,length hocche 5
                itemBuilder: (context, index) { //tarpor ekta index diye dilo
                  final ques = questionList [index]; //questionList theke orthat ei collection ta theke oi index e er jonno question ta age ber
                                                // kore nilam,etar type ta hocche map,ei list theke 1ta index theke nidisto ekta ans ber korbo
                                         //seta hobe 1ta map, tar mane 0 num index er jonno 0 num ques,0 number index er ques seta ber hobe 1st e

                  return QuestionSetView(      //then ber howar por ei widget ta purata return korbe,ques soho ans ,ami aladha 1ta widget er modhe
                                                // rekhe dichi ekhane e creat na kore question_set_page view name e aladha 1ta widget creat korchi
                                                //jekhan thake declare korlam, ekhan theke return kortechi
                    map: ques,    //potita index e je map ta thakbe seta o pass kore dichi
                    index: index,
                    onAnswered: (value) {       //and redio button e click korar por oi value ta ekhane niye ashar por call back korbo onAnswered
                                                //(value) ei je ekhan theke ekhon recive korbo,user jeta select korbe seta ekhan theke recive korbo,
                                                //recive kore oi je potekta ques er givenAnswer: '' jeta emty sekhane assign kore dibo
                      questionList[index] [givenAnswer] = value; //r ekhane recive kortechi & recive korar sathe sathe e amr to upore index ache
                    },
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}




