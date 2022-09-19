import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int? height;
  final int? weight;
  double _bmi = 0;

  String getResult() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getTitle() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getStatement() {
    if (_bmi >= 25) {
      return 'You have a higher BMI. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal BMI. GOOD JOB!!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
