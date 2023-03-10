import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculations extends GetxController {
  RxString answer = ''.obs;
  RxString question = ''.obs;
  RxList numbers = [
    'AC',
    'DEL',
    '%',
    '/',
    7,
    8,
    9,
    '*',
    4,
    5,
    6,
    '-',
    1,
    2,
    3,
    '+',
    'ANS',
    '0',
    '.',
    '=',
  ].obs;
  // RxInt sum = 0.obs;

  void qus(int index) {
    question.value += numbers[index].toString();
  }

  void del() {
    if (question.value.length <= 0) {
      print('Please add values');
    } else {
      question.value = question.substring(0, question.value.length - 1);
    }
  }

  void equlPressed() {
    RxString finalQuestion = question;
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion.value);
    ContextModel cm = ContextModel();

    RxDouble eval = RxDouble(exp.evaluate(EvaluationType.REAL, cm));

    print(eval);
    answer.value = eval.toString();
  }
}
