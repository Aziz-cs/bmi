import 'package:bmi/screens/results_page/results_page.dart';
import 'package:flutter/material.dart';

import '../../../calculator_brain.dart';

import '../../../constants.dart';
import 'resuable_card.dart';

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
              Column(
                children: [
                  Text(
                    widget.resultsFile.getBMRValue(),
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  _buildDropDownMenu(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownButton<String> _buildDropDownMenu() {
    String _value = "Just to survive (Min calories required)";
    List<String> activeState = [
      'Just to survive (Min calories required)',
      'Sedentary (little or no exercise)',
      'Lightly active (light exercise or sports 1-3 days/week)',
      'Moderately active (moderate exercise 3-5 days/week)',
      'Active (hard exercise 6-7 days/week)',
      'Super active (very hard exercise and a physical job)',
    ];
    return DropdownButton<String>(
      value: _value,
      isExpanded: true,
      items: activeState.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              value,
              style: TextStyle(
                color: Colors.pink.shade50,
                fontSize: 18,
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: (selectedValue) {
        setState(() {
          _value = selectedValue;
        });
      },
    );
  }
}
