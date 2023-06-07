import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0 , horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper =[];
  // List<String> questions = [
  //   'You can lead a cow downstairs but not upstairs.',
  //   'Approximately the quarter of human bones are in the feet.',
  //   'A Slug\'s blood is green.',
  // ];

  // List answers = [
  //   false,
  //   true,
  //   true
  // ];

  List<Question> questionBank = [

    Question(q:'You can lead a cow downstairs but not upstairs.', a:false),
    Question(q: 'Approximately the quarter of human bones are in the feet.', a: true),
    Question( q: 'A Slug\'s blood is green.', a: true)
  ];
  int questionNumber = 0;
  void nextQuestion(){
    questionNumber ++;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(questionBank[questionNumber].q,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  )),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              bool correctAnswer = questionBank[questionNumber].a;
              if(correctAnswer == true){
                print('you got it right');
              }else{
                print('You got it wrong');
              }

              setState(() {


                nextQuestion();
              });

            },
            child: Text(
              'true',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              setState(() {
                nextQuestion();
              });
              print(questionNumber);
            },
            child: Text('false',
                style: TextStyle(color: Colors.white, fontSize: 20.0)),
          ),
        )),
        Row(
          children: scoreKeeper,

        )

      ],
    );
  }
}
//You can lead a cow downstairs but not upstairs
//A Slug\'s blood is green
//Approximately ne quarter of human bones are in the feet