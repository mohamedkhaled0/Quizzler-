import 'package:flutter/material.dart';
import 'question.dart';

class QuizBrain {
  List<Question> _AppQuestions = [
    Question(q: 'You can lead a cow down stairs but not up stairs ', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet ',
        a: true),
    Question(q: 'A slug\'s blood is green ', a: true),
    Question(
        q: 'Seahorses have stomachs for the absorption of nutrients from food',
        a: false),
    Question(
        q: 'The letter H is between letters G and J on a keyboard', a: true),
    Question(q: 'Camels have three sets of eyelashes', a: true),
    Question(q: 'There are stars and zigzags on the flag of America', a: false),
    Question(q: 'Some cats are actually allergic to humans', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    Question(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
    Question(
        q: 'No piece of square dry paper can be folded in half more than 7 times.',
        a: false),
    Question(
        q: 'The total surface area of two human lungs is approximately 70 square metres.',
        a: true),
    Question(q: 'Google was originally called \"Backrub\".', a: true),
    Question(
        q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: true),
  ];

  String GetQuestion(int index) {
    return _AppQuestions[index].question;
  }

  bool GetAnswer(int index) {
    return _AppQuestions[index].answer;
  }

  int QustionsNum() {
    return _AppQuestions.length;
  }
}
