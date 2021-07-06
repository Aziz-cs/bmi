import 'dart:ui';

import 'package:bmi/screens/input_page/components/resuable_card.dart';
import 'package:bmi/widgets/activity_drop_menu.dart';
import 'package:flutter/material.dart';

import '../../../calculator_brain.dart';
import '../../../constants.dart';

class BMRResultCard extends StatefulWidget {
  BMRResultCard({this.resultsFile, this.title});
  final CalculatorBrain resultsFile;
  final String title;

  @override
  _BMRResultCardState createState() => _BMRResultCardState();
}

class _BMRResultCardState extends State<BMRResultCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ReusableCard(
          color: kInactiveCardColour,
          cardChild: Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 22.0,
                        fontFamily: kDelaGothicFont,
                        color: Colors.pink.shade100),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.resultsFile.getBMRValue(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "Calories\n / day",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  ActivityDropMenu(
                    calc: widget.resultsFile,
                  ),
                  // _buildDropDownMenu(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ValueListenableBuilder<String>(
                        valueListenable: CalculatorBrain.bmrValue,
                        builder: (_, bmrValue, __) {
                          return Text(
                            bmrValue,
                            style: kNumberTextStyle,
                          );
                        },
                      ),
                      // Text(
                      //   widget.resultsFile
                      //       .calcBMRWithActivity(ActivityDropMenu.userActivity),
                      //   style: TextStyle(
                      //     fontSize: 55,
                      //     fontWeight: FontWeight.w900,
                      //   ),
                      // ),
                      Text(
                        "Calories\n / day",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  RichText _buildTipText({String title, String explanation}) {
    return RichText(
        text:
            TextSpan(style: TextStyle(fontStyle: FontStyle.italic), children: [
      TextSpan(text: title, style: TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(
        text: explanation,
      ),
    ]));
  }
}
