import 'dart:math';

class Bmi_Calculator {
  Bmi_Calculator({this.height, this.weight});

  int height;
  int weight;

  double _bmi;

  String getbmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getresult() {
    if (_bmi > 25)
      return 'Overweight';
    else if (_bmi > 18)
      return 'Normal';
    else
      return 'UnderWeight';
  }

  String getadvice() {
    if (_bmi > 25)
      return ' You have a higher weight than normal body weight, Try to exercise more.';
    else if (_bmi > 18)
      return 'You have a normal bmi, Good job!';
    else
      return ' You have a lower weight than normal body weight, Try to eat more.';
  }
}
