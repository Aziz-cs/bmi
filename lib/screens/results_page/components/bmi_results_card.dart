import 'package:bmi/screens/input_page/components/resuable_card.dart';
import 'package:bmi/screens/results_page/results_page.dart';
import 'package:flutter/material.dart';

import '../../../calculator_brain.dart';
import '../../../constants.dart';
import 'bmi_result_bar.dart';

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
      flex: 6,
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
                style: kNumberTextStyle,
              ),
              BMIResultBar(resultType: widget.resultsFile.getBMIResultType()),
              Text(
                widget.resultsFile.getInterpretation(),
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
