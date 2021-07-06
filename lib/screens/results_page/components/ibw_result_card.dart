import 'dart:ui';

import 'package:bmi/screens/input_page/components/resuable_card.dart';
import 'package:bmi/widgets/activity_drop_menu.dart';
import 'package:flutter/material.dart';

import '../../../calculator_brain.dart';
import '../../../constants.dart';

class IBWResultCard extends StatelessWidget {
  IBWResultCard({this.resultsFile});
  final CalculatorBrain resultsFile;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ReusableCard(
          color: kInactiveCardColour,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Ideal Body Wegiht",
                style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: kDelaGothicFont,
                    color: Colors.pink.shade100),
              ),
              Text(
                resultsFile.getIBWValue(),
                style: kNumberTextStyle,
              ),
              Text(
                getIdealWeightTip(
                    resultsFile.weight, int.parse(resultsFile.getIBWValue())),
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String getIdealWeightTip(int userWeight, int idealWeight) {
  print("userweight $userWeight");
  print(idealWeight);
  if (userWeight == idealWeight) {
    return "You have exact Ideal Body Weight, Well done!";
  } else if (userWeight < idealWeight) {
    int difference = idealWeight - userWeight;
    return "You need to gain $difference KG to have Ideal Body Weight";
  } else if (userWeight > idealWeight) {
    int difference = userWeight - idealWeight;
    return "You need to lose $difference KG to have Ideal Body Weight";
  }
}
