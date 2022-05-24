import 'package:bmi_calc/helper/bmi_calc.dart';
import 'package:bmi_calc/repository/category_repo.dart';
import 'package:bmi_calc/repository/interpretation_repo.dart';

class BmiServices {
  int weight;
  int height;

  BmiServices({required this.weight, required this.height});

  int getScore() {
    BmiCalc bmiResult = BmiCalc(weight, height);
    return bmiResult.calculateBMI();
  }

  String getInterpretation(int score) {
    InterpretationRepo _inter = InterpretationRepo();
    if (score >= 25) {
      return _inter.getInterpretation(0);
    } else if (score >= 18.5) {
      return _inter.getInterpretation(1);
    } else {
      return _inter.getInterpretation(2);
    }
  }

  String getResult(int score) {
    CategoryRepo _result = CategoryRepo();
    if (score >= 25) {
      return _result.getResult(0);
    } else if (score >= 18.5) {
      return _result.getResult(1);
    } else {
      return _result.getResult(2);
    }
  }
}
