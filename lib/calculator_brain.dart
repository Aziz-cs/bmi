import 'package:bmi/screens/input_page/input_page.dart';
import 'package:bmi/screens/results_page/components/bmr_results_card.dart';
import 'package:bmi/widgets/activity_drop_menu.dart';
import 'package:flutter/material.dart';
import 'dart:math';

enum BMIResult { normal, overweight, underweight }

class CalculatorBrain {
  static ValueNotifier<String> bmrValue = ValueNotifier("0");

  CalculatorBrain({
    @required this.weight,
    @required this.height,
    @required this.age,
    @required this.gender,
  });
  final int weight;
  final int height;
  final int age;
  final Gender gender;
  double _bmi;

  String getBMIValue() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  BMIResult getBMIResultType() {
    if (_bmi >= 25) {
      return BMIResult.overweight;
    } else if (_bmi > 18.5) {
      return BMIResult.normal;
    } else {
      return BMIResult.underweight;
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  String getBMRValue() {
    double bmrValue;
    //  (9.99 × weight [kg]) + (6.25 × height [cm]) − (4.92 × age [years]) + 5
    if (gender == Gender.male) {
      bmrValue = (9.99 * weight) + (6.25 * height) - (4.92 * age) + 5;
      print("BMR Value: $bmrValue");

      return bmrValue.round().toString();
    }

    if (gender == Gender.female) {
      bmrValue = (9.99 * weight) + (6.25 * height) - (4.92 * age) - 161;
      return bmrValue.round().toString();
    }

    return "Please try again";
  }

  String calcBMRWithActivity(UserActivity userActivity) {
    double _bmrValue;
    double activityRatio = 1.0;
    switch (userActivity) {
      case UserActivity.none:
        activityRatio = 1;
        break;
      case UserActivity.sedentaryActive:
        activityRatio = 1.2;
        break;
      case UserActivity.lightlyActive:
        activityRatio = 1.375;
        break;
      case UserActivity.moderatelyActive:
        activityRatio = 1.55;
        break;
      case UserActivity.highlyActive:
        activityRatio = 1.725;
        break;
      case UserActivity.superActive:
        activityRatio = 1.9;
        break;
    }
    //  (9.99 × weight [kg]) + (6.25 × height [cm]) − (4.92 × age [years]) + 5
    if (gender == Gender.male) {
      _bmrValue = (9.99 * weight) + (6.25 * height) - (4.92 * age) + 5;
      print("BMR Value: $bmrValue");
      String result = (_bmrValue * activityRatio).round().toString();
      bmrValue.value = result;
      return result;
    }

    if (gender == Gender.female) {
      _bmrValue = (9.99 * weight) + (6.25 * height) - (4.92 * age) - 161;
      String result = (_bmrValue * activityRatio).round().toString();
      bmrValue.value = result;
      return result;
    }

    return "Please try again";
  }

  String getIBWValue() {
    print("bmi: $_bmi");
    // double idealBodyWeight =
    //     (2.2 * _bmi) + (3.5 * _bmi) * ((height / 100) - 1.5);
    double idealBodyWeight;
    if (gender == Gender.male) {
      idealBodyWeight = 50 + (0.91 * (height - 152.4));
    } else {
      idealBodyWeight = 45.5 + (0.91 * (height - 152.4));
    }
    print("idealBodyWeight: $idealBodyWeight");

    return idealBodyWeight.round().toString();
  }

  int getWeight() {
    return weight;
  }
}
