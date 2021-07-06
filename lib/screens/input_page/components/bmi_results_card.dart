import 'package:bmi/screens/results_page/components/bmi_result_bar.dart';
import 'package:bmi/screens/results_page/results_page.dart';
import 'package:flutter/material.dart';

import '../../../calculator_brain.dart';
import '../../../constants.dart';
import 'resuable_card.dart';

class BMIResultCard extends StatefulWidget {
  BMIResultCard({this.resultsFile, this.title});
  final CalculatorBrain resultsFile;
  final String title;

  @override
  _BMIResultCardState createState() => _BMIResultCardState();
}

class _BMIResultCardState extends State<BMIResultCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ReusableCard(
          color: kInactiveCardColour,
          cardChild: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: kDelaGothicFont,
                    color: Colors.pink.shade100),
              ),
              Text(
                widget.resultsFile.getBMIValue(),
                style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.w900,
                ),
              ),
              BMIResultBar(resultType: BMIResult.normal),
              Text(
                widget.resultsFile.getInterpretation(),
                style: TextStyle(
                  fontSize: 22,
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
