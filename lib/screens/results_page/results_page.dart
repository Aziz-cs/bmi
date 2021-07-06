import 'package:bmi/calculator_brain.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/screens/results_page/components/ibw_result_card.dart';
import 'package:bmi/widgets/activity_drop_menu.dart';
import 'package:bmi/widgets/bottom_btn.dart';
import "package:flutter/material.dart";

import 'components/bmi_results_card.dart';
import 'components/bmr_results_card.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.resultsFile});

  final CalculatorBrain resultsFile;
  @override
  Widget build(BuildContext context) {
    ValueNotifier(CalculatorBrain.bmrValue);
    resultsFile.calcBMRWithActivity(ActivityDropMenu.userActivity);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "BMI IBW BMR Calculator",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "YOUR RESULT",
                style: kLargeButtonTextStyle,
              ),
            ),
            BMIResultCard(
              resultsFile: resultsFile,
              title: "Body Mass Index",
            ),
            IBWResultCard(
              resultsFile: resultsFile,
            ),
            BMRResultCard(
              resultsFile: resultsFile,
              title: "Basal Metabolic Rate",
            ),
            BottomBtn(
              label: "RE-CALCULATE",
              onPress: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
