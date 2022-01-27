import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/data.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = new QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  //local variables

  List<Icon> Checker = [];

  int Index = 0;
  int score = 0;

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.GetQuestion(Index),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  bool CorrectAns = true;
                  if (quizBrain.GetAnswer(Index) == CorrectAns) {
                    Checker.add(const Icon(
                      Icons.check_box,
                      color: Colors.green,
                    ));
                    score++;
                  } else {
                    Checker.add(const Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  }
                  Index++;
                  if (Index == quizBrain.QustionsNum()) {
                    //alert
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "Quiz End",
                      desc:
                          "You have finished all questions , Your Score : $score",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Try Again",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                    Index = 0;
                    Checker.clear();
                    score = 0;
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  bool CorrectAns = false;
                  if (quizBrain.GetAnswer(Index) == CorrectAns) {
                    Checker.add(
                      const Icon(
                        Icons.check_box,
                        color: Colors.green,
                      ),
                    );
                    score++;
                  } else {
                    Checker.add(const Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  }

                  Index++;
                  if (Index == quizBrain.QustionsNum()) {
                    //alert
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "Quiz End",
                      desc:
                          "You have finished all questions , Your Score : $score ",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Try Again",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                    Index = 0;
                    Checker.clear();
                    score = 0;
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: Checker,
        )
      ],
    );
  }
}
